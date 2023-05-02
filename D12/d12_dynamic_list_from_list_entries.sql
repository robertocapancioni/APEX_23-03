select null "level",
  ENTRY_TEXT label,
  ENTRY_TARGET target,
  ENTRY_TEXT image_alt_attribute,
  ENTRY_IMAGE CARD_INITIALS,
  '<img src="'||  ENTRY_IMAGE|| '"/>'  attribute3,
  application_id,
  application_name,
  list_name,
  parent_entry_text
  from APEX_APPLICATION_LIST_ENTRIES 
-- where application_name=''
--   and list_name=''
--   and parent_entry_text=''
 order by display_sequence
