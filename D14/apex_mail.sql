begin
    apex_mail.send (
        p_to                 => 'roberto.capancioni@gmail.com',
        p_template_static_id => 'M01',
        p_placeholders       => '{' ||
        '    "ORDER_NUMBER":'            || apex_json.stringify( 'some_value' ) ||
        '   ,"CUSTOMER_NAME":'           || apex_json.stringify( 'some_value' ) ||
        '   ,"ORDER_DATE":'              || apex_json.stringify( 'some_value' ) ||
        '   ,"SHIP_TO":'                 || apex_json.stringify( 'some_value' ) ||
        '   ,"SHIPPING_ADDRESS_LINE_1":' || apex_json.stringify( 'some_value' ) ||
        '   ,"SHIPPING_ADDRESS_LINE_2":' || apex_json.stringify( 'some_value' ) ||
        '   ,"ITEMS_ORDERED":'           || apex_json.stringify( 'some_value' ) ||
        '   ,"ORDER_TOTAL":'             || apex_json.stringify( 'some_value' ) ||
        '   ,"ORDER_URL":'               || apex_json.stringify( 'some_value' ) ||
        '   ,"MY_APPLICATION_LINK":'     || apex_json.stringify( apex_mail.get_instance_url || apex_page.get_url( 
                                                                                                                  p_application =>:app_alias 
                                                                                                                 ,p_page        =>:app_page_alias
                                                                                                                 )) ||
        '}' );
    apex_mail.push_queue();
end;


return apex_mail.get_instance_url || apex_page.get_url( 
                                                        p_application =>:app_alias 
                                                       ,p_page        =>:app_page_alias
                                                       );
