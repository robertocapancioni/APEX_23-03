apex.item( "P5_CATEGORIA" ).getValue();
$( "#P5_CATEGORIA" ).val();
$v( "P5_CATEGORIA" );
$x("P5_CATEGORIA").value;


apex.item( "P5_CATEGORIA" ).setValue('Vikas');
$x("P5_CATEGORIA").value='Vikas';
$("#P5_CATEGORIA" ).val('Vikas'); // ??
$s('P5_CATEGORIA','Vikas');   // ??

$("#P5_CATEGORIA_LABEL").text(); //to get label text

$("#P5_CATEGORIA_LABEL").text('Vikas Pandey'); //to Set label text


apex.item( "P4_ID" ).setValue('1');
apex.item( "P4_ID" ).getValue();

apex.submit({request:"SAVE",
             set:{"P4_ID":"1"}
            });

apex.submit({request:"DELETE"});
