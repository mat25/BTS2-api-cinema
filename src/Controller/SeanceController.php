<?php

namespace App\Controller;


use App\Repository\UserRepository;
use App\Service\CreerReservation;
use App\Service\ReservationRequete;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Csrf\TokenStorage\TokenStorageInterface;
use Symfony\Component\Serializer\SerializerInterface;

#[Route('/api')]
class SeanceController extends AbstractController
{
    #[Route('/reservation', name: 'app_reservation_seance')]
    public function resevation(Request $request,CreerReservation $creerReservation,SerializerInterface $serializer,TokenInterface $tokenInterface): Response
    {
        // récupere les données de la requete sous form de tableau
        $donnees = json_decode($request->getContent(), true);

        $email = $tokenInterface->getUser()->getUserIdentifier();
        if ($email == "") {
            return new JsonResponse("L'utilisateur n'a pas été trouver !", 400);
        }

        // Création des classes
        $requete = new ReservationRequete($donnees["idSeance"],$donnees["nbPlace"]);


        try {
            // Créer le user
            $reservation = $creerReservation->execute($requete,$email);

            // Si pas d'erreur on renvoie le User avec un status 201
            $reservationSerialized = $serializer->serialize($reservation, 'json', ['groups' => 'info_reservation']);
            return new Response($reservationSerialized, 201, [
                'content-type' => 'application/json'
            ]);
        } catch (\Exception $e) {
            // Si erreur on renvoie status 400 avec l'erreur
            return new JsonResponse($e->getMessage(), 400);
        }
    }
}
