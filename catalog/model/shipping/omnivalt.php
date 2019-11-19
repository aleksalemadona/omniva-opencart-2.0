<?php

/**
 * Generating omnivalt shipping options
 * parcel_terminal option needs to have terminals saved in session
 * vqmod edits shipping_method.php to manage checkout correct terminal choice.
 * courier and parcel terminals
 */
class ModelShippingOmnivalt extends Model
{
  public function getQuote($address)
  {

    $currency_carrier = "EUR";
    $total_kg = $this->cart->getWeight();
    $weight_class_id = $this->config->get('config_weight_class_id');
    $unit = $this->db->query("SELECT unit FROM `" . DB_PREFIX . "weight_class_description` wcd WHERE (weight_class_id = " . $weight_class_id . ") AND language_id = '" . (int) $this->config->get('config_language_id') . "'");
    $unit = $unit->row['unit'];
    if ($unit == 'g') {
      $total_kg /= 1000;
    }
    $this->load->language('shipping/omnivalt');
    if ($this->session->data['currency'] !== 'EUR') {
      return array();
    }
    $method_data = array();
    $service_Actives = $this->config->get('omnivalt_service');
    //print_r($service_Actives); echo "Well shit"; die;
    if (is_array($service_Actives) && count($service_Actives) && ($address['iso_code_2'] == 'LT' ||
      $address['iso_code_2'] == 'LV' ||
      $address['iso_code_2'] == 'EE')) {
      $cart_price = $this->cart->getTotal();
      $cart_price = $this->currency->format($cart_price, $this->session->data['currency'], false, false);
      //die($cart_price);
      foreach ($service_Actives as $key => $service_Active) {
        $price_target = 'omnivalt_' . $service_Active . '_price';
        if ($address['iso_code_2'] != 'LT' && ($address['iso_code_2'] == 'LV' || $address['iso_code_2'] == 'EE')) {
          $price_target .= strtolower($address['iso_code_2']);
        }
        $price = $this->config->get($price_target);

        $free_price = 'omnivalt_' . $service_Active  . '_free';
        if ($address['iso_code_2'] != 'LT') {
          $free_price .= strtolower($address['iso_code_2']);
        }
        $price_free = $this->config->get($free_price);
        if ($price_free && $price_free < $cart_price) {
            $price = 0;
        }

        if (stripos($price, ':') !== false) {
          $prices = explode(',', $price);
          if (!is_array($prices)) {
            continue;
          }
          $price = false;
          foreach ($prices as $price) {
            $priceArr = explode(':', str_ireplace(array(' ', ','), '', $price));
            if (!is_array($priceArr) || count($priceArr) != 2) {
              continue;
            }
            if ($priceArr[0] >= $total_kg) {
              $price = $priceArr[1];
              break;
            }
          }
        }
        if ($price === false) {
          continue;
        }

        $title = $this->language->get('text_' . $service_Active);
        $codeCarrier = "omnivalt";
        if ($service_Active == "parcel_terminal") {
          $codeCarrier = 'fake';
        }
        if ($codeCarrier == 'fake') {
          $cabins = $this->loadTerminals();
          // if (strpos(VERSION, '2.0') === 0) { // fix for opencart 2.0
          //   $cabins = json_decode($this->config->get('omnivalt_terminals_LT'));
          // } else {
          //   $cabins = $this->config->get('omnivalt_terminals_LT');
          // }
          $terminals = $this->groupTerminals($cabins, $address['iso_code_2']);
        } else { // courier doesnt need terminals
          $terminals = null;
        }

        $quote_data[$service_Active] = array(
          'code' => $codeCarrier . '.' . $service_Active,
          'title' => $title,
          'head' => $title,
          'terminals' => $terminals,
          'cost' => $this->currency->convert($price, $currency_carrier, $this->config->get('config_currency')),
          'tax_class_id' => $this->config->get('omnivalt_tax_class_id'),
          'sort_order' => $this->config->get('omnivalt_sort_order'),
          'text' => $this->currency->format(
            $this->tax->calculate(
              $this->currency->convert($price, $currency_carrier, $this->session->data['currency']), 
              $this->config->get('omnivalt_tax_class_id'), 
              $this->config->get('config_tax')
            ), 
            $this->session->data['currency']
          ),
        );
      }

      if (!(isset($quote_data)) || !is_array($quote_data)) {
        return '';
      }

      $method_data = array(
        'code' => 'omnivalt',
        'title' => $this->language->get('text_title'),
        'quote' => $quote_data,
        'sort_order' => $this->config->get('omnivalt_sort_order'),
        'error' => '',
      );
    }
    return $method_data;
  }

  private function loadTerminals()
  {
    $terminals_json_file_dir = DIR_DOWNLOAD."omniva_terminals.json";
    if (!file_exists($terminals_json_file_dir))
      return false;
    $terminals_file = fopen($terminals_json_file_dir, "r");
    if (!$terminals_file)
      return false;
    $terminals = fread($terminals_file, filesize($terminals_json_file_dir) + 10);
    fclose($terminals_file);
    $terminals = json_decode($terminals, true);
    return $terminals;
  }

  private function groupTerminals($terminals, $country = 'LT', $selected = '')
  {
    if(!$terminals) {
      return [];
    }
    // sort terminals by coordinates
    usort($terminals, function ($a, $b) {
      if ($a[1] == $b[1]) {
        return ($a[0] < $b[0]) ? -1 : 1;
      }
      return ($a[1] < $b[1]) ? -1 : 1;
    });

    $parcel_terminals = [];
    if (is_array($terminals)) {
      foreach ($terminals as $terminal) {
        if (isset($terminal[5]) && $terminal[5] == $country) {
          $parcel_terminals[(string) $terminal[3]] = $terminal[0] . ', ' . $terminal[2];
        }
      }
    }
    return $parcel_terminals;
  }
}
