DELETE FROM discussion WHERE id_discussion>0;
DELETE FROM amis WHERE id_amis>0;
DELETE FROM login WHERE id_login>0;
DELETE FROM membre WHERE id_membre>0;
DELETE FROM admin WHERE id_admin>0;



INSERT INTO admin (id_admin, login_admin, pass_admin) VALUES (1, 'admin', 'admin');

INSERT INTO membre (id_membre, nom_membre, prenom_membre, sexe_membre, date_naissance_membre) VALUES (1, 'RATSIMANDRESY', 'Gino', 'Homme', '1994-08-28');
INSERT INTO membre (id_membre, nom_membre, prenom_membre, sexe_membre, date_naissance_membre) VALUES (2, 'RABOANALY', 'Randy', 'Femme', '1998-02-15');

INSERT INTO login (id_login, id_membre, pseudo_login, pass_login) VALUES (1, 1, 'Gino', 'Gino');
INSERT INTO login (id_login, id_membre, pseudo_login, pass_login) VALUES (2, 2, 'Randy', 'Randy');

INSERT INTO amis (id_amis, id_membre1, id_membre2, etat_amis) VALUES (1, 1, 2, 1);

INSERT INTO discussion (id_discussion, id_login, etat_discussion) VALUES (1, 1, false);
INSERT INTO discussion (id_discussion, id_login, etat_discussion) VALUES (2, 2, false);
