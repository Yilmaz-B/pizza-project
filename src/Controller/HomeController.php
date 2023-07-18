<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;


class HomeController extends AbstractController
{
    #[Route('home', name: 'home')]
    public function showCategory(ManagerRegistry $doctrine):Response
    {

        $category = $doctrine->getRepository(Category::class)->findAll();
        return $this->render('home.html.twig', ['categories' => $category]);
    }
}