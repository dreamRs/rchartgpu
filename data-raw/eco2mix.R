## code to prepare `eco2mix` dataset goes here

library(httr2)
library(data.table)


# TR ----------------------------------------------------------------------

dataset_id <- "eco2mix-national-tr"
reponse <- request(paste0(
  "https://odre.opendatasoft.com",
  sprintf("/api/explore/v2.1/catalog/datasets/%s/exports/csv", dataset_id)
)) %>%
  req_url_query(
    select = "date_heure,consommation,fioul,charbon,gaz,nucleaire,eolien,solaire,hydraulique,pompage,bioenergies"
  ) %>%
  req_perform()
eco2mix_tr <- fread(text = resp_body_string(reponse))
setorder(eco2mix_tr, date_heure)
eco2mix_tr <- eco2mix_tr[minute(date_heure) %in% c(0, 30)]


eco2mix_tr_conso <- eco2mix_tr[
  !is.na(consommation),
  list(consommation = round(mean(consommation))),
  by = list(date_heure = lubridate::floor_date(date_heure, unit = "day"))
]
eco2mix_tr_prod <- eco2mix_tr[
  !is.na(nucleaire),
  lapply(.SD, function(x) round(mean(x))),
  by = list(date_heure = lubridate::floor_date(date_heure, unit = "day")),
  .SDcols = c("fioul", "charbon", "gaz", "nucleaire", "eolien", "solaire", "hydraulique", "pompage", "bioenergies")
]

chartgpu(eco2mix_tr_conso, tooltip = list(show = TRUE, trigger = "axis"))
chartgpu(eco2mix_tr_prod)


# Cons --------------------------------------------------------------------

dataset_id <- "eco2mix-national-cons-def"
reponse <- request(paste0(
  "https://odre.opendatasoft.com",
  sprintf("/api/explore/v2.1/catalog/datasets/%s/exports/csv", dataset_id)
)) %>%
  req_url_query(
    select = "date_heure,consommation,fioul,charbon,gaz,nucleaire,eolien,solaire,hydraulique,pompage,bioenergies"
  ) %>%
  req_perform()
eco2mix_cons <- fread(text = resp_body_string(reponse))
setorder(eco2mix_cons, date_heure)
eco2mix_cons <- eco2mix_cons[!is.na(consommation)]



# Both --------------------------------------------------------------------

eco2mix <- rbind(eco2mix_cons, eco2mix_tr)
chartgpu(eco2mix)

# -------------------------------------------------------------------------

# setDF(eco2mix)
# usethis::use_data(eco2mix, overwrite = TRUE)
