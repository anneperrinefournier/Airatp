# Airatp – Plateforme de location de véhicules imaginaires de style Airbnb

Ce projet a été développé comme projet de fin de formation au Le Wagon, avec une équipe de 4 membres sur une période d’une semaine. L’objectif était de créer un site web de type Airbnb spécifiquement dédié à la location de véhicules imaginaires.<br>
Voir des images du projet [ici](https://troopl.com/anneperrinefournier/airatp))

## Présentation du Projet

Airatp offre une plateforme permettant aux utilisateurs d'explorer et de louer une variété de véhicules fantastiques et imaginaires. Le site web est conçu pour émuler l'expérience conviviale d'Airbnb, facilitant la découverte et la réservation de leur moyen de transport de rêve, même s'il n'existe que dans leur imagination.

## Technologies Utilisées

- **Ruby on Rails :** Utilisé pour le backend et la gestion des données.
- **JavaScript (Stimulus) :** Employé pour les interactions dynamiques et l'amélioration de l'expérience utilisateur.
- **CSS et HTML :** Responsables du style et de la structure du site web.
- **API Mapbox :** Intégrée pour la gestion de cartographie, l’emplacement des véhicules disponibles.
- **API Cloudinary :** Employée pour le stockage et la gestion d'images.
- **Librairie Flatpicker :** Sélection des dates (range).

## Fonctionnalités Clés

- **Annonces de Véhicules Imaginaires :** Les utilisateurs peuvent parcourir et rechercher une gamme variée de véhicules imaginaires disponibles à la location.
- **Barre de navigation :** Les utilisateurs peuvent rechercher un véhicule avec un ou plusieurs critères : sélection dans des listes déroulantes, barre de recherche pour écrire ce qu’ils souhaitent. Ils peuvent cumuler les listes et la barre de recherche.
- **Système de Réservation :** Système intégré permettant aux utilisateurs de réserver leurs véhicules souhaités pour des dates spécifiques.
- **Calcul du prix :** Prix calculé en fonction de la période sélectionnée.
- **Authentification Utilisateur :** Authentification sécurisée des utilisateurs pour la création et la gestion de leur compte.
- **Tableau de bord des véhicules loués :** Pour accepter/refuser les demandes de location si on est le propriétaire, et pour suivre ses locations et leur statut (en attente/validé/refusé) si on est le loueur.

# Comment Exécuter le Projet en Local

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous que Ruby on Rails est installé.
3. Installez les dépendances avec la commande `bundle install`.
4. Configurez les paramètres nécessaires, y compris les clés d'API, le cas échéant.
5. Exécutez les migrations de base de données avec `rails db:migrate`.
6. Lancez l'application avec `rails server`.
7. Accédez à l'application dans votre navigateur à l'adresse `http://localhost:3000`.

## Contributeurs

- **Anne-Perrine Fournier :** - Barre de navigation et de recherche, configuration du seed, flatpicker et système de réservation. Figma, html et css de la home, de la navigation et des composants récurrents.
- **Alexis de Temmerman :** - Configuration de l’application, tableau de bord des véhicules loués, statut des véhicules (en attente/validé/refusé).
- **Pierre-François Thomas :** - Configuration du seed, calcul du prix (JS), css et html de la page d'un véhicule.
- **Henri Guillot** - Configuration de l’application, API mapbox, tableau de bord des véhicules loués.

## Remerciements

Nous tenons à remercier l’équipe du Le Wagon pour son soutien et ses enseignements tout au long de ce projet passionnant.
