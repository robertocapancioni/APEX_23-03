apex.submit({request:"CREATE",
             set:{"P3_CODICE_CLIENTE":"X001",
                  "P3_RAGIONE_SOCIALE":"XXX SPA",
                  "P3_PIVA":"XXXXXXXXXXX",
                  "P3_INDIRIZZO":"VIA XXXXXX"}
            });

apex.submit({request:"SAVE",
             set:{"P3_CODICE_CLIENTE":"NUOVO CODICE"}
            });

apex.submit({request:"DELETE"});