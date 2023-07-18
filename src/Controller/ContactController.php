<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'contact')]
    public function home():Response
    {
        $test = "";
        return $this->render('contact.html.twig', ['test' => $test]);
    }
}