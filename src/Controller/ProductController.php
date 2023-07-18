<?php
// src/Controller/ProductController.php
namespace App\Controller;

// ...
use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Product;
use App\Form\OrderType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use MongoDB\Driver\Manager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    #[Route('/products', name: 'products')]
    public function showProducts(ManagerRegistry $doctrine):Response
    {
        $products = $doctrine->getRepository(Product::class)->findAll();
        return $this->render('products.html.twig', ['products' => $products]);
    }

    #[Route('/category/{id}', name: 'product')]
    public function show(ManagerRegistry $doctrine, int $id): Response
    {
        $category = $doctrine->getRepository(Category::class)->find($id);
        return $this->render('product.html.twig', ['products'=> $category->getProducts()]);
    }

    #[Route('/product/{id}', name: 'order')]
    public function order(Request $request, int $id, EntityManagerInterface $entityManager):Response
    {
        $product = $entityManager->getRepository(Product::class)->find($id);

        $order = new Order();
        $order->setPrice($product->getPrice());

        $form = $this->createForm(OrderType::class, $order);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $order->setProduct($product);
            $order = $form->getData();
            $entityManager->persist($order);
            $entityManager->flush();
            $this->addFlash('success', 'Uw bestelling is geplaatst!');
            return $this->redirectToRoute('home');
        }

        return $this->renderForm('order.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/overview', name: 'overview')]
    public function overview(ManagerRegistry $doctrine)
    {
        $order = $doctrine->getRepository(Order::class)->findAll();
        return $this->render('overview.html.twig', ['orders' => $order]);
    }
}