/*
Exemple de requêtes effectuées sur la base de donnée modélisme.
*/

use modelisme;

-- 1 - combien de maquettes en plastique
SELECT count(materiaux.nom)
FROM  maquette, maquette_has_materiaux, materiaux
WHERE maquette.produit_id = maquette_has_materiaux.maquette_produit_id
AND maquette_has_materiaux.materiaux_id = materiaux.id
AND materiaux.nom = 'plastique';

-- 2 - Quels sont les maquette de la marque tamiya
SELECT produit.nom AS nomProduit, marque.nom AS nomMarque
FROM marque, produit, maquette
WHERE produit.id = maquette.produit_id
AND produit.marque_id = marque.id
AND marque.nom = 'tamiya';

-- 3 - la liste des produits de la categorie “en l’air”
SELECT produit.nom AS nomProduit, categorie.nom AS nomCategorie
FROM produit, produit_has_categorie, categorie
WHERE produit.id = produit_has_categorie.produit_id
AND categorie.id = produit_has_categorie.categorie_id
AND categorie.nom = 'En l\'air';

-- 4 - combien y a t’il de commande au total
SELECT COUNT(id) AS nbTotalCommande FROM modelisme.commande

-- 5 - je veux consulter les produits de la marque tamiya.
SELECT produit.nom AS nomProduit, marque.nom AS nomMarque
FROM marque, produit
WHERE marque.id = produit.marque_id
AND marque.nom = 'tamiya';

-- 6 -La liste des produits de la commande 1
SELECT produit.nom, commande.id
FROM produit, commander, commande
WHERE produit.id = commander.produit_id
AND commander.commande_id = commande.id
AND commande.id = 1;



-- 7 - Quel est le produit le plus cher de la marque Kyosho
SELECT produit.prix, marque.nom AS nomMarque, produit.nom AS nomProduit
FROM maquette
JOIN produit
ON produit.id = maquette.produit_id
JOIN marque
ON marque.id = produit.marque_id
WHERE prix =(SELECT max(prix) from produit);

-- 8 - Quel est la marque du Jaune sable?
SELECT marque.nom AS nomMarque, produit.nom AS nomPeinture
FROM produit
JOIN marque
ON marque.id = produit.marque_id
WHERE produit.nom = 'jaune sable';

-- 9 - Combien y a t’il de couleur jaune
SELECT COUNT(nom) AS nbDeCouleur FROM produit WHERE nom LIKE '%jaune%';

-- 10 - Quel est le nom de l’acheteur et la date de la dernière commande
SELECT nom, dateCreation
FROM acheteur
JOIN commande
ON acheteur.id = commande.acheteur_id
JOIN adresse
ON adresse.id = acheteur.adresse_id
ORDER BY commande.dateCreation DESC limit 1;

-- 11 - Combien de maquette par catégorie
SELECT COUNT(produit.id) AS quantiteProduit, categorie.nom AS categorie
FROM produit
JOIN maquette
ON produit.id = maquette.produit_id
JOIN produit_has_categorie
ON produit.id = produit_has_categorie.produit_id
JOIN categorie
ON produit_has_categorie.categorie_id = categorie.id
GROUP BY categorie.nom;

-- Désolé je n’ai pas réussis à trouver de requêtes pour DISTINCT



-- Une vue d’ensemble des produit de la base modelisme :
SELECT marque.nom AS nomMarque, produit.nom AS nomProduit,produit.prix, produit.description, peinture.ral, maquette.rc, categorie.nom AS categorie
FROM produit
LEFT JOIN peinture
ON produit.id = peinture.produit_id
JOIN marque
ON marque.id = produit.marque_id
LEFT JOIN maquette
ON produit.id = maquette.produit_id
JOIN produit_has_categorie
ON produit.id = produit_has_categorie.produit_id
JOIN categorie
ON produit_has_categorie.categorie_id = categorie.id;
