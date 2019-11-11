<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-omnivalt" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        <a onclick="$('#download').val('1');$('#form-omnivalt').submit();" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_download; ?>"><?php echo $button_download; ?></i></a>
        </div>
      <h1><?php echo $heading_title; ?></h1><span class="version"><?php echo $version; ?></span>
      <div>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if (isset($download_notification)) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $download_notification; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-omnivalt" class="form-horizontal">
          <input type="hidden" id="download" name="download" value=0 />
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><?php echo $entry_url; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_url" value="<?php echo $omnivalt_url; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
              <?php if ($error_url) { ?>
              <div class="text-danger"><?php echo $error_url; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><?php echo $entry_user; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_user" value="<?php echo $omnivalt_user; ?>" placeholder="<?php echo $entry_user; ?>" id="input-key" class="form-control" />
              <?php if ($error_user) { ?>
              <div class="text-danger"><?php echo $error_user; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="omnivalt_password" value="<?php echo $omnivalt_password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_name"><?php echo $entry_sender_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_name" value="<?php echo $omnivalt_sender_name; ?>" placeholder="<?php echo $entry_sender_name; ?>" id="input-sender_name" class="form-control" />
              <?php if ($error_sender_name) { ?>
              <div class="text-danger"><?php echo $error_sender_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_address"><?php echo $entry_sender_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_address" value="<?php echo $omnivalt_sender_address; ?>" placeholder="<?php echo $entry_sender_address; ?>" id="input-sender_address" class="form-control" />
              <?php if ($error_sender_address) { ?>
              <div class="text-danger"><?php echo $error_sender_address; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_postcode"><?php echo $entry_sender_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_postcode" value="<?php echo $omnivalt_sender_postcode; ?>" placeholder="<?php echo $entry_sender_postcode; ?>" id="input-sender_postcode" class="form-control" />
              <?php if ($error_sender_postcode) { ?>
              <div class="text-danger"><?php echo $error_sender_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_city"><?php echo $entry_sender_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_city" value="<?php echo $omnivalt_sender_city; ?>" placeholder="<?php echo $entry_sender_city; ?>" id="input-sender_city" class="form-control" />
              <?php if ($error_sender_city) { ?>
              <div class="text-danger"><?php echo $error_sender_city; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_country_code"><?php echo $entry_sender_country_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_country_code" value="<?php echo $omnivalt_sender_country_code; ?>" placeholder="<?php echo $entry_sender_country_code; ?>" id="input-sender_country_code" class="form-control" />
              <?php if ($error_sender_country_code) { ?>
              <div class="text-danger"><?php echo $error_sender_country_code; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_phone"><?php echo $entry_sender_phone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sender_phone" value="<?php echo $omnivalt_sender_phone; ?>" placeholder="<?php echo $entry_sender_phone; ?>" id="input-sender_phone" class="form-control" />
              <?php if ($error_sender_phone) { ?>
              <div class="text-danger"><?php echo $error_sender_phone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_service; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 100px; overflow: auto;">
                <?php foreach ($services as $service) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($service['value'], $omnivalt_service)) { ?>
                    <input type="checkbox" name="omnivalt_service[]" value="<?php echo $service['value']; ?>" checked="checked" />
                    <?php echo $service['text']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="omnivalt_service[]" value="<?php echo $service['value']; ?>" />
                    <?php echo $service['text']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
          </div></div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-parcel_terminal_price">LT <?php echo $entry_parcel_terminal_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_price" value="<?php echo $omnivalt_parcel_terminal_price; ?>" placeholder="<?php echo $entry_parcel_terminal_price; ?>" id="input-parcel_terminal_price" class="form-control" />
              <?php if ($error_parcel_terminal_price) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_price; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-parcel_terminal_free"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_free" value="<?php echo $omnivalt_parcel_terminal_free; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-parcel_terminal_free" class="form-control" />
              <?php if ($error_parcel_terminal_free) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_free; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-courier_price">LT <?php echo $entry_courier_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_price" value="<?php echo $omnivalt_courier_price; ?>" placeholder="<?php echo $entry_courier_price; ?>" id="input-courier_price" class="form-control" />
              <?php if ($error_courier_price) { ?>
              <div class="text-danger"><?php echo $error_courier_price; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-courier_free"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_free" value="<?php echo $omnivalt_courier_free; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-courier_free" class="form-control" />
              <?php if ($error_courier_free) { ?>
              <div class="text-danger"><?php echo $error_courier_free; ?></div>
              <?php } ?>
            </div>
          </div>

          <!-- additional pricing EE, LV -->
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-parcel-terminal-pricelv">LV <?php echo $entry_parcel_terminal_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_pricelv" value="<?php echo $omnivalt_parcel_terminal_pricelv; ?>" placeholder="<?php echo $entry_parcel_terminal_price; ?>" id="input-parcel-terminal-pricelv" class="form-control" />
              <?php if ($error_parcel_terminal_pricelv) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_pricelv; ?></div>
              <?php } ?>
             </div>
             <label class="col-sm-2 control-label" for="input-parcel_terminal_freelv"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_freelv" value="<?php echo $omnivalt_parcel_terminal_freelv; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-parcel_terminal_freelv" class="form-control" />
              <?php if ($error_parcel_terminal_freelv) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_freelv; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-courier_pricelv">LV <?php echo $entry_courier_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_pricelv" value="<?php echo $omnivalt_courier_pricelv; ?>" placeholder="<?php echo $entry_courier_price; ?>" id="input-courier_pricelv" class="form-control" />
              <?php if ($error_courier_pricelv) { ?>
              <div class="text-danger"><?php echo $error_courier_pricelv; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-courier_freelv"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_freelv" value="<?php echo $omnivalt_courier_freelv; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-courier_freelv" class="form-control" />
              <?php if ($error_courier_freelv) { ?>
              <div class="text-danger"><?php echo $error_courier_freelv; ?></div>
              <?php } ?>
            </div>
          </div>



          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-parcel_terminal_priceee">EE <?php echo $entry_parcel_terminal_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_priceee" value="<?php echo $omnivalt_parcel_terminal_priceee; ?>" placeholder="<?php echo $entry_parcel_terminal_price; ?>" id="input-parcel_terminal_priceee" class="form-control" />
              <?php if ($error_parcel_terminal_priceee) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_priceee; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-parcel_terminal_freeee"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_parcel_terminal_freeee" value="<?php echo $omnivalt_parcel_terminal_freeee; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-parcel_terminal_freeee" class="form-control" />
              <?php if ($error_parcel_terminal_freeee) { ?>
              <div class="text-danger"><?php echo $error_parcel_terminal_freeee; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-courier_priceee">EE <?php echo $entry_courier_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_priceee" value="<?php echo $omnivalt_courier_priceee; ?>" placeholder="<?php echo $entry_courier_price; ?>" id="input-courier_priceee" class="form-control" />
               <?php if ($error_courier_priceee) { ?>
              <div class="text-danger"><?php echo $error_courier_priceee; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-courier_freeee"><?php echo $entry_free_price; ?></label>
            <div class="col-sm-4">
              <input type="text" name="omnivalt_courier_freeee" value="<?php echo $omnivalt_courier_freeee; ?>" placeholder="<?php echo $entry_free_price; ?>" id="input-courier_freeee" class="form-control" />
              <?php if ($error_courier_freeee) { ?>
              <div class="text-danger"><?php echo $error_courier_freeee; ?></div>
              <?php } ?>
            </div>
          </div>
          <!--/ Additional pricing -->


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_company" value="<?php echo $omnivalt_company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
             </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-bankaccount"><?php echo $entry_bankaccount; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_bankaccount" value="<?php echo $omnivalt_bankaccount; ?>" placeholder="<?php echo $entry_bankaccount; ?>" id="input-bankaccount" class="form-control" />
             </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickupstart"><?php echo $entry_pickupstart; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_pickupstart" value="<?php echo $omnivalt_pickupstart; ?>" placeholder="<?php echo $entry_pickupstart; ?>" id="input-pickupstart" class="form-control" />
             </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickupstart"><?php echo $entry_pickupfinish; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_pickupfinish" value="<?php echo $omnivalt_pickupfinish; ?>" placeholder="<?php echo $entry_pickupfinish; ?>" id="input-pickupfinish" class="form-control" />
             </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickup-type"><?php echo $entry_pickup_type; ?></label>
            <div class="col-sm-10">
              <select name="omnivalt_pickup_type" id="input-pickup-type" class="form-control">
                <?php if ($omnivalt_pickup_type == 'parcel_terminal') { ?>
                <option value="parcel_terminal" selected="selected"><?php echo $text_parcel_terminal; ?></option>
                <?php } else { ?>
                <option value="parcel_terminal"><?php echo $text_parcel_terminal; ?></option>
                <?php } ?>
                <?php if ($omnivalt_pickup_type == 'courier') { ?>
                <option value="courier" selected="selected"><?php echo $text_courier; ?></option>
                <?php } else { ?>
                <option value="courier"><?php echo $text_courier; ?></option>
                <?php } ?>
                <?php if ($omnivalt_pickup_type == 'sorting_center') { ?>
                <option value="sorting_center" selected="selected"><?php echo $text_sorting_center; ?></option>
                <?php } else { ?>
                <option value="sorting_center"><?php echo $text_sorting_center; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod"><?php echo $entry_cod; ?></label>
            <div class="col-sm-10">
              <select name="omnivalt_cod" id="input-cod" class="form-control">
                <?php if ($omnivalt_cod) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="omnivalt_status" id="input-status" class="form-control">
                <?php if ($omnivalt_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax-class-id"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-10">
              <select name="omnivalt_tax_class_id" id="input-tax-class-id" class="form-control">
                <option value="0" selected="selected">No tax zone</option>
                <?php foreach ($tax_classes as $tax_class) : ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" 
                    <?php if ($tax_class['tax_class_id'] == $omnivalt_tax_class_id) { echo 'selected="selected"'; }?>>
                    <?php echo $tax_class['title']; ?>
                  </option>
                <?php endforeach; ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="omnivalt_sort_order" value="<?php echo $omnivalt_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
          <div class="form-group">
                    <label class="col-sm-2 control-label" for="terminals"><?php echo $entry_terminals; ?></label>
                    <div class="col-sm-10" id="terminals">
                      <p class="form-control-static">
                        <?php echo (isset($omnivalt_terminals)?count($omnivalt_terminals):0); ?>
                      </p>
                    </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="cron-url"><?=$text_cron_url;?></label>
            <div class="col-sm-10" id="cron-url">
              <p class="form-control-static">
                <a href="<?php echo $cron_url; ?>" target="_blank"/><?php echo $cron_url; ?></a>
              </p>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
