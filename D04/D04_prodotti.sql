drop table d04_prodotti;
drop table d04_marchio;
drop sequence d04_prodotti_seq;

--create table with sample prodotti
create table d04_prodotti (
    prodotto_id number constraint d04_prodotti_pk primary key,
    prodotto varchar2(255) not null,
    marchio_id number, 
    url_immagine varchar2(400),
    prodotto_cod varchar2(255),
    descrizione varchar2(1500),
    prezzo number,
    tags varchar2(400),
    genere varchar2(20),
    data_rilascio date
);

      
--create table that contains the marchio for the sample prodotti
create table d04_marchio (
    marchio_id number constraint d04_marchio_prodotti_pk primary key,
    marchio varchar2(255)
);

alter table d04_prodotti
add constraint d04_marchio_fk
       foreign key (marchio_id)
       references d04_marchio(marchio_id);

       
create sequence d04_prodotti_seq
minvalue 1
increment by 1;

create or replace trigger d04_biu_a_prodotti
    before insert or update on d04_prodotti
    for each row
begin
    if :new.prodotto_id is null then 
        :new.prodotto_id := d04_prodotti_seq.nextval;
    end if;
    
end biu_a_prodotti;
/
-- rem inserting into d04_marchio
set define off;
insert into d04_marchio (marchio_id,marchio) values (1,'CORE/NEO');
insert into d04_marchio (marchio_id,marchio) values (2,'ORIGINALS');
insert into d04_marchio (marchio_id,marchio) values (3,'ESSENTIALS');
insert into d04_marchio (marchio_id,marchio) values (4,'FIVE TEN');
insert into d04_marchio (marchio_id,marchio) values (5,'TERREX');
insert into d04_marchio (marchio_id,marchio) values (6,'SWIM');
insert into d04_marchio (marchio_id,marchio) values (7,'SPORTSWEAR');

--rem inserting into d04_prodotti
set define off;
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (1,'Pharrell Williams HU NMD ',2,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/1184b37ec6244b218e45ada300ee61db_9366/Pharrell_Williams_HU_NMD_Shoes_Grey_GW3955_01_standard.jpg','AH2430','Channeling the streamlined look of an '''80s racer, these shoes are updated with modern features. The foot-hugging adidas Primeknit upper offers a soft, breathable feel. The Boost midsole provides responsive comfort accented with a contrast-color EVA heel plug. Embroidered details add a distinctive finish.',180,'Running:Outdoors',to_date('01-GEN-22','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (2,'Grand Court Alpha',3,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/003eeac37e6242218947ad66007a629b_9366/Grand_Court_Alpha_Shoes_White_GX8165_01_standard.jpg','GX8165','Sometimes classic is the best answer for the future. These adidas tennis-inspired sneakers ground you in a modern classic while you explore what makes you you. Wear them all day for any occasion.',70,'Sneakers:Lifestyle',to_date('08-DIC-21','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (3,'Terrex Agravic Pro Trail',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bb4ce34cfb454213be1fae2700a9ce1c_9366/Terrex_Agravic_Pro_Trail_Running_Shoes_Black_H06572_01_standard.jpg','H06572','No trail is too technical and no terrain too rough for the adidas Terrex Agravic Pro Trail Running Shoes. Full-length rock protection through the midsole lets you move across rugged ground without missing a step. Abrasion-resistant weldings add the durability to handle scrapes and scuffs through rocks and debris. A Continental™ Rubber outsole offers extraordinary traction in wet and dry conditions.',260,'Outdoors:Hiking',to_date('02-FEB-20','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (4,'Duramo 10',1,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/87768e212e034ff78d6dad6700b3eee2_9366/Duramo_10_Shoes_Blue_GW8347_01_standard.jpg','CG4051','Refine your interval training in these women'''s versatile running-inspired shoes. Featuring a lightweight mesh and synthetic upper, they combine responsive midsole cushioning with a soft collar that reduces ankle pressure. ',100,'Running:Sneakers',to_date('18-NOV-20','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (5,'EnergyFalcon X ',1,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/478ede140e624f8682f1ab3600c5c036_9366/Energyfalcon_Shoes_Blue_EG2928_01_standard.jpg','EE9940','When you dig deep to reach your goals, these running shoes offer the support and stability you need. Every step feels pillow-soft with plush cushioning and an OrthoLiteÂ® sockliner for comfort. A flowing TPU heel counter and thin support cage keep the foot centred and stable. The durable outsole is made for logging many miles.',80,'Running:Outdoors:Sneakers:Lifestyle',to_date('05-MAR-19','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (6,'Kirigami Climbing Shoes',4,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e5af14ce349449168188ab4100e3757f_9366/Five_Ten_Kirigami_Climbing_Shoes_Black_EE8935_01_standard.jpg','EE8935','When long-wearing comfort outweighs the need for a technical, aggressive feel, the Five Ten Kirigami Climbing Shoes set a versatile standard. The neutral fit and rounded toe box work with the medium flex to support all-purpose climbing, providing comfort for beginners and more advanced climber'''s alike.',90,'Outdoors:Hiking',to_date('15-GIU-18','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (7,'Terrex Swift R3 Gore-TEX ',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dbcc110f963f485ca462ad8600916db0_9366/Terrex_Swift_R3_GORE-TEX_Hiking_Shoes_Grey_GZ3046_01_standard.jpg','GZ3046','Fast on any hike. The Terrex Swift R3 GORE-TEX combines the lightweight design and cushioning of a trail running shoe with the versatility and stability of a hiking boot.',150,'Hiking',to_date('07-SET-15','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (10,'Terrex Free Hiker Gore-Tex Hiking Shoes',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f185cbd44eda45b692a2ad6e00ed2316_9366/Terrex_Free_Hiker_Gore-Tex_Hiking_Shoes_Grey_GY6134_01_standard.jpg','GY6134','Move and explore. These lightweight shoes deliver next-generation comfort and freedom of movement for hikes long and short. The adidas Primeknit upper hugs your foot for flexible, all-terrain stability, and the responsive Boost midsole delivers endless energy to keep you moving on the trail. A GORE-TEX membrane sheds water while letting your feet breathe.',225,'Outdoors:Hiking',to_date('02-FEB-20','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (11,'Adilette Shower Slides',6,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a64c9a11a1714455bebaad6500ac65f2_9366/Adilette_Shower_Slides_Red_GZ5923_01_standard.jpg','GZ5922','From the pool deck to the shower to the couch, these slides are made for the work-hard-rest-hard lifestyle. The slip-on construction gives you a snug fit that'''s easy to kick on and off as needed. Lightweight cushioning keeps your feet cradled in all-day comfort. The adidas logo and 3-Stripes design complete the iconic Adilette style.',25,'Sandals:Lifestyle',to_date('01-GEN-22','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (12,'Edge Lux',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/119396ca90b24e85aa99ad6a010ec7ee_9366/Edge_Lux_Shoes_White_GX0587_01_standard.jpg','GX0587','Comfort is key, whether you'''re racing to catch a train or rolling up some miles on the weekend. These adidas running shoes have a Bounce midsole that'''s light and flexible to keep you moving. A padded Geofit collar locks you in, so don'''t be afraid to stride it out.',60,'Training:Sneakers',to_date('08-DIC-21','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (13,'AdiPower Weightlifting',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a6a8edf71c624f11987fad8000f4d7a5_9366/Adipower_Weightlifting_II_Shoes_Black_GZ5952_01_standard.jpg','GZ5952','Created to keep you confident when you'''re pushing your limits on the mat. The foot-hugging, reinforced upper and firm TPU midsole on these adidas Adipower Weightlifting II Shoes give you the secure platform you need for heavy lifting. Laces and a midfoot strap work together for solid lockdown. A flexible forefoot gives your toes room to splay so you stay comfortable under the heaviest loads.',200,'Weightlifting',to_date('07-SET-15','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (14,'Speedex 18',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0df62c07b02044bbb212ad7900d35c07_9366/Speedex_18_Black_GX2824_01_standard.jpg','GX2824','Keep your opponents dancing to your tune in these adidas boxing shoes. Built for fast footwork, they have a lightweight mesh upper that hugs your feet for rock-solid stability. Their EVA midsole is softer in the toe and heel but firmer in the midfoot for the perfect combination of cushioning and support. Underneath, a multi-directional Adiwear outsole grips the canvas to help you turn instinct into action.',150,'Boxing:Sportswear',to_date('15-GIU-18','DD-MON-RR'),'Women');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (15,'NMD R1 PrimeBlue ',2,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c3bd9dda9fdd4a7cbc9aad1e00dd0045_9366/NMD_R1_Primeblue_Shoes_White_GZ9260_01_standard.jpg','GZ9260','Pack your bag, lace up and get going. City adventures beckon in these NMD_R1 shoes. An update to an acclaimed '''80s runner from the adidas archive, these modern sneakers have a soft, stretchy knit upper and energy-returning Boost cushioning for all-day comfort. Bold color and signature midsole plugs make a statement, so wherever you'''re headed, you'''re sure to show up in style',150,'Sneakers:Outdoors:Sportswear:Lifestyle',to_date('05-MAR-19','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (16,'Ultraboost 22 ',1,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Ultraboost_22_Shoes_Black_GZ0127_01_standard.jpg','GZ0127','These Ultraboost running shoes serve up comfort and responsiveness. You'''ll be riding on a BOOST midsole for endless energy, with a Linear Energy Push system and a Continental™ Rubber outsole. This shoe'''s upper is made with a high-performance yarn which contains at least 50% Parley Ocean Plastic —  reimagined plastic waste, intercepted on remote islands, beaches, coastal communities and shorelines, preventing it from polluting our ocean.',190,'Running',to_date('08-DIC-21','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (17,'Superstar',2,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Shoes_White_EG4958_01_standard.jpg','EG4958','Originally made for basketball courts in the '''70s. Celebrated by hip hop royalty in the '''80s. The adidas Superstar shoe is now a lifestyle staple for streetwear enthusiasts. The world-famous shell toe feature remains, providing style and protection. Just like it did on the B-ball courts back in the day.',95,'Sneakers:Lifestyle',to_date('31-OTT-17','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (18,'Kaptir 2.0',3,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a5c27ecf96640708466adc801084ef0_9366/Kaptir_2.0_Shoes_Green_GY3676_01_standard.jpg','GY3676','Running can be as much about comfort as it is about style. These adidas running-inspired shoes have a sculpted Cloudfoam midsole that provides pillow-soft comfort. A knit upper and a bold adidas logo complete the look.',85,'Sneakers:Lifestyle:Sportswear',to_date('29-APR-16','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (19,'Adidas 4D FWD ',1,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fe123f747ca042b4b58cad8d00fd817c_9366/adidas_4D_FWD_Shoes_Orange_GX2978_01_standard.jpg','GX2978','Runners chase progress with every step. That'''s why we used data from thousands of athletes to inform the design of these running shoes. They have an adidas 4D midsole that'''s precisely coded to absorb impact, support your gait and make running feel a little easier. The lattice structure is angled to redirect the energy of every footstrike into forward motion.',200,'Running:Outdoors',to_date('01-GEN-22','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (20,'SuperNova+ Shoes',1,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3059fffaa8ce44d39fa3ad86013847b3_9366/Supernova+_Shoes_Grey_GX2952_01_standard.jpg','GX2952','Energy meets comfort with adidas Supernova+. However far or fast you train, the Supernova+ keeps you pushing toward your goals. Like the Supernova, these adidas shoes ride on a combination of Boost and Bounce. The plus in the name refers to the added Boost in the forefoot compared to Supernova, delivering increased energy return and comfort in every stride. Experience the energy of a comfortable run.',120,'Running',to_date('08-DIC-21','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (21,'Adilette Clogs',6,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f544367209ae4494b5f0ab730140c5af_9366/Adilette_Clogs_White_FY8970_01_standard.jpg','FY8970','Based on the iconic adidas slide, these clogs are as functional as they are comfortable. Whether you'''re walking to the gym or pool for an early-morning workout or just want to keep the slouchy-casual vibe going all through your day, slip your feet into the contoured footbeds and head for the door.',45,'Sandals:Lifestyle',to_date('31-OTT-17','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (22,'Ax4 PrimeGreen Hiking Shoes',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/42ceae1c472c45e7b2f4ad7c0105a959_9366/Terrex_AX4_Primegreen_Hiking_Shoes_Blue_GZ3009_01_standard.jpg','GZ3009','Quiver-of-one trail shoes. From forest hikes to alpine adventures, these adidas Terrex hiking shoes let you explore high and low, near or far. Their dual-density design merges the comfort of a cushioned trail runner with the stability of a hiking shoe to take on hikes, scrambles and via ferratas. The all-conditions grip of Continental™ Rubber means you can trust the AX4 to get you anywhere you want to go without worrying about your feet.',90,'Hiking:Outdoors',to_date('02-FEB-20','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (23,'Cyprex Ultra DLX Sandals',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ded96cc3158945e09ce7ad7100d4691f_9366/Terrex_Cyprex_Ultra_DLX_Sandals_Black_GY6115_01_standard.jpg','GY6115','Head outside for casual warm-weather hikes. These sandals have comfortable textile straps and a buckle closure for a secure fit. The rubber outsole provides traction on wet or slippery surfaces.',70,'Hiking',to_date('15-GIU-18','DD-MON-RR'),'Unisex');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (24,'Terrex Trailmaker Hiking Shoes',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/be10995b61414c23be6dabd5011d226d_9366/Terrex_Trailmaker_Hiking_Shoes_Black_FU7237_01_standard.jpg','FU7237','Leave your boots at home. Made for light hikes and non-technical trails, these adidas hiking shoes allow you to move quickly without feeling weighed down. A wider forefoot and EVA support frame offer comfort and stability over the miles. A high-traction outsole maintains confident grip on uneven ground.',110,'Hiking',to_date('29-APR-16','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (25,'Terrex Swift Solo Approach',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0502541604b0404b8619ad81010ca2ae_9366/Terrex_Swift_Solo_Approach_Shoes_Beige_GZ0333_01_standard.jpg','GZ0333','Leave the flat behind and let the fun begin. These adidas approach shoes let you move swiftly over trails, boulder fields and rock scrambles with a high-grip Traxion outsole and Pro-Moderator technology that adds stability. The lightweight ripstop upper holds up to high-abrasion situations, and EVA cushioning keeps you light on your feet.',100,'Hiking:Outdoors',to_date('31-OTT-17','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (26,'Agracic Ultra Trail Running Shoes',5,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a921fa42931c4fc09a9fad7c006e8c1f_9366/Terrex_Agravic_Ultra_Trail_Running_Shoes_Green_H03180_01_standard.jpg','H03180','The Terrex Agravic Ultra has been created in close collaboration with one of the world'''s fastest ultra trail runners, Ekaterina Mityaeva. It is one of the first trail running shoes from adidas to feature a TPE bio-based plate that'''s made out of 90% renewable carbon.​The plate runs the entire length of the shoe for lightweight, durable rock protection over long-distance mountain trails.​ A blend of responsive BOOST and ultra-lightweight Lightstrike ensures high-energy return over mountainous terrain and cushions every stride to help you keep your pace over technical trails.​',160,'Hiking:Outdoors',to_date('05-MAR-19','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (27,'Freerider Pro Mid VCS Mountain Bike Shoes',4,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/43fd9140c1f24896b059ad520105b867_9366/Five_Ten_Freerider_Pro_Mid_VCS_Mountain_Bike_Shoes_Black_H02024_01_standard.jpg','H02024','Technical rock garden or flowy berms. You can bomb down the trail in the adidas Five Ten Freerider Pro Mid Mountain Bike Shoes. They combine the legendary pedal control of the classic Freerider with enhanced toe impact protection and a mid-height cuff with D30 inner ankle padding for added coverage. Their Stealth® S1 Dotty rubber outsole grips wet, slippery ground and your pedals for full control on and off the bike.',180,'Outdoors:Hiking:Sportswear',to_date('01-GEN-22','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (28,'AdiPower Weighlifting II ',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cb13c90bb1de43818d96ad8000f52eeb_9366/Adipower_Weightlifting_II_Shoes_Blue_GZ5954_01_standard.jpg','GZ5954','Created to keep you confident when you'''re pushing your limits on the mat. The foot-hugging, reinforced upper and firm TPU midsole on these adidas Adipower Weightlifting II Shoes give you the secure platform you need for heavy lifting. Laces and a midfoot strap work together for solid lockdown. A flexible forefoot gives your toes room to splay, so you stay comfortable under the heaviest loads.',200,'Weightlifting',to_date('15-GIU-18','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (29,'Box Hog 3',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bda7d7c5643d4490b8c3ad7900ec27a4_9366/BOX_HOG_3_White_GX2815_01_standard.jpg','GX2815','Keep your opponents dancing to your tune in these adidas boxing shoes. Built for fast footwork, they have a lightweight mesh upper that hugs your feet for rock-solid stability. Their EVA midsole is softer in the toe and heel but firmer in the midfoot for the perfect combination of cushioning and support. Underneath, a multi-directional Adiwear outsole grips the canvas to help you turn instinct into action.',100,'Boxing:Sportswear',to_date('08-DIC-21','DD-MON-RR'),'Men');
insert into d04_prodotti (prodotto_id,prodotto,marchio_id,url_immagine,prodotto_cod,descrizione,prezzo,tags,data_rilascio,genere) values (30,'Alphatorsion 2.0 ',7,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2299bec1d08e410db11bad6a00ccac1e_9366/Alphatorsion_2.0_Shoes_Black_GY0592_01_standard.jpg','GY0592','Get ruthless with your cross training. We'''re talking hill sprints, burpees, battle ropes and ladder drills on repeat. Built to keep up, these adidas running shoes have a 360º Torsion System that supports explosive speed in any direction. Bounce cushioning feels light and springy.',110,'Training',to_date('02-FEB-20','DD-MON-RR'),'Men');
