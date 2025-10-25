resource "jamfpro_self_service_branding_image" "icon" {
  self_service_branding_image_file_path = "${path.module}/support-files/self-service-branding-icon.png"
}

resource "jamfpro_self_service_branding_image" "banner" {
  self_service_branding_image_file_path = "${path.module}/support-files/self-service-branding-banner.png"
}

resource "jamfpro_self_service_branding_macos" "default" {
  application_header        = "Pretend Co. Self Service"
  sidebar_heading           = "Self Service"
  sidebar_subheading        = "Pretend Co."
  icon_id                   = jamfpro_self_service_branding_image.icon.id
  home_page_banner_image_id = jamfpro_self_service_branding_image.banner.id
}

resource "jamfpro_self_service_branding_ios" "default" {
  main_header                  = "Pretend Co. Self Service"
  icon_id                      = jamfpro_self_service_branding_image.icon.id
  header_background_color_code = "0066CC"
  menu_icon_color_code         = "FFFFFF"
  branding_name_color_code     = "FFFFFF"
  status_bar_text_color        = "light"
}
