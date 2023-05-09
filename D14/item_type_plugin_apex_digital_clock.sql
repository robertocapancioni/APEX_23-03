set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>1870412561399862
,p_default_application_id=>101
,p_default_owner=>'AKIL_PLUGIN'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/apex_digital_clock
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(5361674079066888)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'APEX.DIGITAL.CLOCK'
,p_display_name=>'APEX Digital Clock'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROCEDURE render( p_item   IN            apex_plugin.t_item',
'                 ,p_plugin IN            apex_plugin.t_plugin',
'                 ,p_param  IN            apex_plugin.t_item_render_param',
'                 ,p_result IN OUT NOCOPY apex_plugin.t_item_render_result',
'                )',
'IS',
'l_attribute          VARCHAR2(32767);',
'l_pixel              CONSTANT VARCHAR2(5) := ''px'';',
'l_clock_class_large  CONSTANT VARCHAR2(15) := ''clock-large'';',
'l_clock_class_small  CONSTANT VARCHAR2(15) := ''clock-small'';',
'l_clock_width_height CONSTANT VARCHAR2(30) := ''clock-width-height'';',
'l_clock_style        CONSTANT apex_application_page_items.attribute_01%TYPE := p_item.attribute_01;',
'l_color              CONSTANT apex_application_page_items.attribute_02%TYPE := p_item.attribute_02;',
'l_font_size          CONSTANT apex_application_page_items.attribute_03%TYPE := p_item.attribute_03||l_pixel;',
'l_font_family        CONSTANT apex_application_page_items.attribute_04%TYPE := p_item.attribute_04;',
'l_letter_spacing     CONSTANT apex_application_page_items.attribute_05%TYPE := p_item.attribute_05||l_pixel;',
'l_line_height        CONSTANT apex_application_page_items.attribute_06%TYPE := p_item.attribute_06||l_pixel; ',
'l_bg_color           CONSTANT apex_application_page_items.attribute_07%TYPE := p_item.attribute_07;   ',
'l_border_color       CONSTANT apex_application_page_items.attribute_08%TYPE := p_item.attribute_08;   ',
'l_border_style       CONSTANT apex_application_page_items.attribute_09%TYPE := p_item.attribute_09;',
'l_time_format        CONSTANT apex_application_page_items.attribute_10%TYPE := p_item.attribute_10;',
'BEGIN',
'    --When Clock Style is Default',
'    IF l_clock_style = ''D'' THEN',
'        l_attribute := ''class="clock-default"'';',
'',
'    --When Clock Style is Custom  ',
'    ELSIF l_clock_style = ''C'' THEN',
'        l_attribute := ''style="width:max-content;height:max-content;''',
'                        ||''padding: 10px 10px 10px 10px;''',
'                        ||''color:''||l_color||'';''',
'                        ||''font-size:''||l_font_size||'';''',
'                        ||''font-family:''||l_font_family||'';''',
'                        ||''letter-spacing:''||l_letter_spacing||'';''',
'                        ||''line-height:''||l_line_height||'';''',
'                        ||''background-color:''||l_bg_color||'';''',
'                        ||''border-color:''||l_border_color||'';''                                                                                           ',
'                        ||''border-style:''||l_border_style||'';"'';',
'',
'    --When Clock Style is Accent1 (Small)                                            ',
'    ELSIF l_clock_style = ''A1S'' THEN',
'        l_attribute := ''class="clock-accent1 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';  ',
'',
'    --When Clock Style is Accent1 (Large)  ',
'    ELSIF l_clock_style = ''A1L'' THEN',
'        l_attribute := ''class="clock-accent1 ''||l_clock_class_large||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent2 (Small)  ',
'    ELSIF l_clock_style = ''A2S'' THEN',
'        l_attribute := ''class="clock-accent2 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent1 (Large)  ',
'    ELSIF l_clock_style = ''A2L'' THEN',
'        l_attribute := ''class="clock-accent2 ''||l_clock_class_large||'' ''||l_clock_width_height||''"''; ',
'',
'    --When Clock Style is Accent3 (Small)  ',
'    ELSIF l_clock_style = ''A3S'' THEN',
'        l_attribute := ''class="clock-accent3 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent3 (Large)  ',
'    ELSIF l_clock_style = ''A3L'' THEN',
'        l_attribute := ''class="clock-accent3 ''||l_clock_class_large||'' ''||l_clock_width_height||''"''; ',
'',
'    --When Clock Style is Accent4 (Small)  ',
'    ELSIF l_clock_style = ''A4S'' THEN',
'        l_attribute := ''class="clock-accent4 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent4 (Large)  ',
'    ELSIF l_clock_style = ''A4L'' THEN',
'        l_attribute := ''class="clock-accent4 ''||l_clock_class_large||'' ''||l_clock_width_height||''"''; ',
'',
'    --When Clock Style is Accent5 (Small)  ',
'    ELSIF l_clock_style = ''A5S'' THEN',
'        l_attribute := ''class="clock-accent5 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent5 (Large)  ',
'    ELSIF l_clock_style = ''A5L'' THEN',
'        l_attribute := ''class="clock-accent5 ''||l_clock_class_large||'' ''||l_clock_width_height||''"''; ',
'',
'    --When Clock Style is Accent6 (Small)  ',
'    ELSIF l_clock_style = ''A6S'' THEN',
'        l_attribute := ''class="clock-accent6 ''||l_clock_class_small||'' ''||l_clock_width_height||''"'';',
'',
'    --When Clock Style is Accent6 (Large)  ',
'    ELSIF l_clock_style = ''A6L'' THEN',
'        l_attribute := ''class="clock-accent6 ''||l_clock_class_large||'' ''||l_clock_width_height||''"'';                                                   ',
'    END IF;',
'    ',
'    --To create a hidden element to store the value',
'    htp.p(''<input type="hidden" name="''||p_item.name||''" id="''||p_item.name||''" value="">'');',
'                                        ',
'    --To create a display only element',
'    apex_plugin_util.print_display_only( p_item_name        => p_item.name',
'                                        ,p_display_value    => ''''',
'                                        ,p_show_line_breaks => FALSE',
'                                        ,p_escape           => FALSE',
'                                        ,p_attributes       => l_attribute',
'                                       );                  ',
'',
'    --To add the CSS file            ',
'    apex_css.add_file(p_name  => ''digiClockAccents'',',
'                      p_directory => p_plugin.file_prefix,',
'                      p_version => NULL);',
'    ',
'    --To add the JavaScript file ',
'    apex_javascript.add_library(p_name        => ''digiClock'',',
'                                p_directory   => p_plugin.file_prefix,',
'                                p_version     => NULL',
'                               );',
'    ',
'    --To fire the JavaScript code on load',
'    apex_javascript.add_onload_code (''setInterval(function() {''',
'                                                    ||''digitalClock.show(''||APEX_JAVASCRIPT.ADD_VALUE( p_item.name, TRUE )',
'                                                                          ||APEX_JAVASCRIPT.ADD_VALUE( l_time_format, FALSE )||'')''',
'                                                    ||''},100);''',
'                                    );',
'    ',
'    p_result.is_navigable := TRUE;',
'END render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'VISIBLE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/akilr/Digital-Clock'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5362751393092793)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Clock Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'D'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5363095888094332)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>10
,p_display_value=>'Default'
,p_return_value=>'D'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5363431701095822)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>20
,p_display_value=>'Accent1 (Small)'
,p_return_value=>'A1S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5363891564097845)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>30
,p_display_value=>'Accent1 (Large)'
,p_return_value=>'A1L'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5364279020098708)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>40
,p_display_value=>'Accent2 (Small)'
,p_return_value=>'A2S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5364629799101102)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>50
,p_display_value=>'Accent2 (Large)'
,p_return_value=>'A2L'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5365090304102129)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>60
,p_display_value=>'Accent3 (Small)'
,p_return_value=>'A3S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5365414132103764)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>70
,p_display_value=>'Accent3 (Large)'
,p_return_value=>'A3L'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5365896125107170)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>80
,p_display_value=>'Accent4 (Small)'
,p_return_value=>'A4S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5366242219107916)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>90
,p_display_value=>'Accent4 (Large)'
,p_return_value=>'A4L'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5366697763109081)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>100
,p_display_value=>'Accent5 (Small)'
,p_return_value=>'A5S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5367062105113007)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>110
,p_display_value=>'Accent5 (Large)'
,p_return_value=>'A5L'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5367430496114217)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>120
,p_display_value=>'Accent6 (Small)'
,p_return_value=>'A6S'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5367869105115223)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>130
,p_display_value=>'Accent6 (Large)'
,p_return_value=>'A6L'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5368272376117773)
,p_plugin_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_display_sequence=>140
,p_display_value=>'Custom'
,p_return_value=>'C'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5368662200130229)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#8F00FF'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5368952676154263)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Font-Size'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'60'
,p_unit=>'Pixels'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5369233898158056)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Font-Family'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Orbitron'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5369576422161480)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Letter-Spacing'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'7'
,p_unit=>'Pixels'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5369871182165836)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Line-Height'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'50'
,p_unit=>'Pixels'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5370174168169153)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Background-Color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#ffff'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5370452203173697)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Border-Color'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#dfdfdf'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5370756002179400)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Border-Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'dashed'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5362751393092793)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'C'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5372115689335348)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>10
,p_display_value=>'dashed'
,p_return_value=>'dashed'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5372524760336838)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>20
,p_display_value=>'dotted'
,p_return_value=>'dotted'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5372902773337582)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>30
,p_display_value=>'double'
,p_return_value=>'double'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5373307765338767)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>40
,p_display_value=>'groove'
,p_return_value=>'groove'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5373789369340142)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>50
,p_display_value=>'inset'
,p_return_value=>'inset'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5374144080342869)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>60
,p_display_value=>'none'
,p_return_value=>'none'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5374538086343555)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>70
,p_display_value=>'outset'
,p_return_value=>'outset'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5374922537345480)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>80
,p_display_value=>'ridge'
,p_return_value=>'ridge'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5375301517346223)
,p_plugin_attribute_id=>wwv_flow_api.id(5370756002179400)
,p_display_sequence=>90
,p_display_value=>'solid'
,p_return_value=>'solid'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5371025258184187)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>1
,p_prompt=>'Time Format'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'FMT12'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5371352393193784)
,p_plugin_attribute_id=>wwv_flow_api.id(5371025258184187)
,p_display_sequence=>10
,p_display_value=>'12 Hour'
,p_return_value=>'FMT12'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5371702098195333)
,p_plugin_attribute_id=>wwv_flow_api.id(5371025258184187)
,p_display_sequence=>20
,p_display_value=>'24 Hour'
,p_return_value=>'FMT24'
,p_is_quick_pick=>true
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F204469676974616C20436C6F636B20696E204F7261636C6520415045580D0A2F2F20417574686F723A20416B696C20520D0A2F2F2056657273696F6E3A20312E300D0A0D0A766172206469676974616C436C6F636B203D207B0D0A202020200D0A09';
wwv_flow_api.g_varchar2_table(2) := '2F2F66756E6374696F6E20746F2073686F772074686520636C6F636B2076616C75650D0A202020202F2F6966202D3E20746F2073686F77207468652074696D6520696E20313220686F757220666F726D61740D0A202020202F2F656C7365202D3E20746F';
wwv_flow_api.g_varchar2_table(3) := '2073686F77207468652074696D6520696E20323420686F757220666F726D6174090D0A202020206D7954696D65723A2066756E6374696F6E28704974656D2C7054696D65466F726D6174297B0D0A090920202020202020207661722064617465203D206E';
wwv_flow_api.g_varchar2_table(4) := '6577204461746528292C206F7074696F6E73203D207B686F757231323A2066616C73657D3B0D0A090909090D0A090909096966287054696D65466F726D6174203D3D2027464D54313227297B0D0A0909090920202020617065782E6974656D2870497465';
wwv_flow_api.g_varchar2_table(5) := '6D292E73657456616C756528646174652E746F4C6F63616C6554696D65537472696E672829293B0D0A202020202020202020202020202020207D0D0A09090909656C7365206966287054696D65466F726D6174203D3D2027464D54323427297B0D0A2020';
wwv_flow_api.g_varchar2_table(6) := '202020202020202020202020202020202020617065782E6974656D28704974656D292E73657456616C756528646174652E746F4C6F63616C6554696D65537472696E67285B5D2C6F7074696F6E7329293B0D0A202020202020202020202020202020207D';
wwv_flow_api.g_varchar2_table(7) := '0909090D0A202020207D2C0D0A090D0A092F2F66756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0D0A2020202073686F773A2066756E6374696F6E28704974656D2C7054696D65466F726D6174297B0D0A2020';
wwv_flow_api.g_varchar2_table(8) := '202020202020202020206469676974616C436C6F636B2E6D7954696D657228704974656D2C7054696D65466F726D617429200D0A097D2009090D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5362048980083064)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_file_name=>'digiClock.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A204469676974616C20436C6F636B20696E204F7261636C652041504558202A2F0D0A2F2A20417574686F723A20416B696C2052202A2F0D0A2F2A2056657273696F6E3A20312E30202A2F0D0A0D0A0D0A40696D706F72742075726C28226874747073';
wwv_flow_api.g_varchar2_table(2) := '3A2F2F666F6E74732E676F6F676C65617069732E636F6D2F6373733F66616D696C793D4F72626974726F6E7C417564696F776964657C4172746966696B617C466172726F7C47656F737461722046696C6C7C446F204879656F6E22293B0D0A0D0A2E636C';
wwv_flow_api.g_varchar2_table(3) := '6F636B2D64656661756C747B0D0A09626F726465723A6E6F6E652021696D706F7274616E743B0D0A20202020666F6E742D66616D696C793A6F72626974726F6E2021696D706F7274616E743B0D0A202020206C65747465722D73706163696E673A357078';
wwv_flow_api.g_varchar2_table(4) := '2021696D706F7274616E743B0D0A20202020666F6E742D7765696768743A626F6C642021696D706F7274616E743B200D0A20202020666F6E742D73697A653A203272656D2021696D706F7274616E743B090D0A7D0D0A2E636C6F636B2D77696474682D68';
wwv_flow_api.g_varchar2_table(5) := '65696768747B0D0A2020202077696474683A6D61782D636F6E74656E742021696D706F7274616E743B0D0A096865696768743A6D61782D636F6E74656E742021696D706F7274616E743B0D0A7D0D0A2E636C6F636B2D736D616C6C7B0D0A202020207061';
wwv_flow_api.g_varchar2_table(6) := '6464696E673A20313070782031307078203130707820313070782021696D706F7274616E743B0D0A09666F6E742D73697A653A20333070782021696D706F7274616E743B0D0A096C65747465722D73706163696E673A203570782021696D706F7274616E';
wwv_flow_api.g_varchar2_table(7) := '743B0D0A096C696E652D6865696768743A20333070782021696D706F7274616E743B09090D0A7D0D0A2E636C6F636B2D6C617267657B0D0A2020202070616464696E673A20313070782031307078203130707820313070782021696D706F7274616E743B';
wwv_flow_api.g_varchar2_table(8) := '0D0A09666F6E742D73697A653A20363070782021696D706F7274616E743B200D0A202020206C65747465722D73706163696E673A20313070782021696D706F7274616E743B0D0A096C696E652D6865696768743A20363070782021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(9) := '3B090D0A7D0D0A2E636C6F636B2D616363656E74317B0D0A20202020636F6C6F723A20233136653937322021696D706F7274616E743B0D0A096261636B67726F756E642D636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F72';
wwv_flow_api.g_varchar2_table(10) := '6465722D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A09626F726465722D7374796C653A206E6F6E652021696D706F7274616E743B0D0A09666F6E742D66616D696C793A206F72626974726F6E2021696D706F7274616E743B0D';
wwv_flow_api.g_varchar2_table(11) := '0A7D0D0A2E636C6F636B2D616363656E74327B0D0A20202020636F6C6F723A20233030303030302021696D706F7274616E743B0D0A096261636B67726F756E642D636F6C6F723A20236537626130352021696D706F7274616E743B0D0A09626F72646572';
wwv_flow_api.g_varchar2_table(12) := '2D636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F726465722D7374796C653A20646F75626C652021696D706F7274616E743B0D0A09666F6E742D66616D696C793A20617564696F776964652021696D706F7274616E743B0D';
wwv_flow_api.g_varchar2_table(13) := '0A09746578742D736861646F773A20302E35707820302E3570782023666666662021696D706F7274616E743B0D0A7D0D0A2E636C6F636B2D616363656E74337B0D0A20202020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A0962';
wwv_flow_api.g_varchar2_table(14) := '61636B67726F756E642D636F6C6F723A20233036626366622021696D706F7274616E743B0D0A202020206261636B67726F756E642D696D6167653A206C696E6561722D6772616469656E74283331356465672C20233036626366622030252C2023343838';
wwv_flow_api.g_varchar2_table(15) := '34656520373425292021696D706F7274616E743B0D0A09626F726465722D636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F726465722D7374796C653A2067726F6F76652021696D706F7274616E743B0D0A09666F6E742D66';
wwv_flow_api.g_varchar2_table(16) := '616D696C793A206172746966696B612021696D706F7274616E743B0D0A20202020746578742D736861646F773A20312E35707820312E357078202330303030303021696D706F7274616E743B090D0A7D0D0A2E636C6F636B2D616363656E74347B0D0A20';
wwv_flow_api.g_varchar2_table(17) := '202020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A096261636B67726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C207267622838302C203230312C20313935292C20726762283135302C203232';
wwv_flow_api.g_varchar2_table(18) := '322C2032313829292021696D706F7274616E743B0D0A09626F726465722D636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F726465722D7374796C653A206F75747365742021696D706F7274616E743B0D0A09666F6E742D66';
wwv_flow_api.g_varchar2_table(19) := '616D696C793A20466172726F2021696D706F7274616E743B090D0A09746578742D736861646F773A203270782032707820233030303030302021696D706F7274616E743B0D0A7D0D0A2E636C6F636B2D616363656E74357B0D0A20202020636F6C6F723A';
wwv_flow_api.g_varchar2_table(20) := '20234646303030302021696D706F7274616E743B0D0A096261636B67726F756E642D636F6C6F723A20233438353436312021696D706F7274616E743B0D0A202020206261636B67726F756E642D696D6167653A206C696E6561722D6772616469656E7428';
wwv_flow_api.g_varchar2_table(21) := '3331356465672C20233438353436312030252C202332383331336220373425292021696D706F7274616E743B0D0A09626F726465722D636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F726465722D7374796C653A206E6F6E';
wwv_flow_api.g_varchar2_table(22) := '652021696D706F7274616E743B0D0A09666F6E742D66616D696C793A20446F204879656F6E2021696D706F7274616E743B0D0A20202020746578742D736861646F773A20302E35707820302E3570782023666666662021696D706F7274616E743B090D0A';
wwv_flow_api.g_varchar2_table(23) := '7D0D0A2E636C6F636B2D616363656E74367B0D0A20202020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A096261636B67726F756E642D636F6C6F723A20233030383038302021696D706F7274616E743B0D0A09626F726465722D';
wwv_flow_api.g_varchar2_table(24) := '636F6C6F723A20233030303030302021696D706F7274616E743B0D0A09626F726465722D7374796C653A20736F6C69642021696D706F7274616E743B0D0A09666F6E742D66616D696C793A206F72626974726F6E2021696D706F7274616E743B090D0A09';
wwv_flow_api.g_varchar2_table(25) := '746578742D736861646F773A203270782032707820233030303030302021696D706F7274616E743B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5362379763083065)
,p_plugin_id=>wwv_flow_api.id(5361674079066888)
,p_file_name=>'digiClockAccents.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
