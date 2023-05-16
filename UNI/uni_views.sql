create or replace view uni_appello_vw as
select a.id,
       a.appello,
       a.data,
       m.laurea_id,
       l.laurea,
       l.anno_inizio anno_inizio_laurea,
       l.tipo_laurea_id,
       tl.tipo_laurea,
       l.facolta_id,
       f.facolta,
       m.docente_id,
       d.docente,
       a.materia_id,
       m.materia,
       m.materia_des,
       m.anno,
       m.periodo,
       m.crediti 
  from uni_appello a
  join uni_materia m on a.materia_id = m.id
  join uni_laurea  l on m.laurea_id  = l.id
  join uni_facolta f on l.facolta_id = f.id
  join uni_tipo_laurea  tl on l.tipo_laurea_id  = tl.id
  join uni_docente d on m.docente_id = d.id;

create or replace view uni_materia_vw as
select m.id,
       m.laurea_id,
       l.laurea,
       l.anno_inizio anno_inizio_laurea,
       l.tipo_laurea_id,
       tl.tipo_laurea,
       l.facolta_id,
       f.facolta,
       m.docente_id,
       d.docente,
       m.materia,
       m.materia_des,
       m.anno,
       m.periodo,
       m.crediti 
  from uni_materia m 
  join uni_laurea  l on m.laurea_id  = l.id
  join uni_facolta f on l.facolta_id = f.id
  join uni_tipo_laurea  tl on l.tipo_laurea_id  = tl.id
  join uni_docente d on m.docente_id = d.id;

create or replace view uni_laurea_vw as
select l.id,
       l.laurea,
       l.anno_inizio anno_inizio_laurea,
       apex_string.get_initials(l.laurea)laurea_iniz,
       l.tipo_laurea_id,
       tl.tipo_laurea,
       l.facolta_id,
       f.facolta
  from uni_laurea  l
  join uni_tipo_laurea  tl on l.tipo_laurea_id  = tl.id
  join uni_facolta f on l.facolta_id = f.id;

create or replace view uni_docente_vw as
select d.id,
       d.docente,
       apex_string.get_initials(d.docente)docente_iniz,
       d.facolta_id,
       f.facolta
  from uni_docente d
  join uni_facolta f on d.facolta_id = f.id;

create or replace view uni_studente_vw as
select s.id,
       s.studente,
       dbms_lob.getlength(s.foto)foto_len,
       s.foto,
       s.foto_filename,
       s.foto_mimetype,
       s.foto_lastupd,
       apex_string.get_initials(s.studente)studente_iniz,
       s.laurea_id,
       l.laurea,
       l.anno_inizio anno_inizio_laurea,
       l.tipo_laurea_id,
       tl.tipo_laurea,
       l.facolta_id,
       f.facolta
  from uni_studente s
  join uni_laurea  l on s.laurea_id = l.id
  join uni_tipo_laurea  tl on l.tipo_laurea_id  = tl.id
  join uni_facolta f on l.facolta_id = f.id;

create or replace view uni_esame_vw as
select e.id,
       e.esame,
       e.voto,
       e.stato_esame_id,
       se.stato_esame,
       e.appello_id,
       e.studente_id,
       s.studente,
       a.appello,
       a.data,
       m.laurea_id,
       l.laurea,
       l.anno_inizio anno_inizio_laurea,
       l.tipo_laurea_id,
       tl.tipo_laurea,
       l.facolta_id,
       f.facolta,
       m.docente_id,
       d.docente,
       a.materia_id,
       m.materia,
       m.materia_des,
       m.anno,
       m.periodo,
       m.crediti 
  from uni_esame e
  join uni_stato_esame se on e.stato_esame_id = se.id
  join uni_studente s on e.studente_id = s.id
  join uni_appello a on e.appello_id = a.id
  join uni_materia m on a.materia_id = m.id
  join uni_laurea  l on m.laurea_id  = l.id
  join uni_facolta f on l.facolta_id = f.id
  join uni_tipo_laurea  tl on l.tipo_laurea_id  = tl.id
  join uni_docente d on m.docente_id = d.id;
