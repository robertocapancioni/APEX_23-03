function custom_authenticate  
  (  
    p_username in varchar2,  
    p_password in varchar2  
  )  
  return boolean  is
  begin
  if upper(p_username) = 'ROBERTO' and p_password='roberto' 
  then 
    return true;
  else 
    return false; 
  end if; 
  end;
