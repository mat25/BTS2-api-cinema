<?php

namespace App\Repository;

use App\Entity\Film;
use App\Entity\Seance;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Film>
 *
 * @method Film|null find($id, $lockMode = null, $lockVersion = null)
 * @method Film|null findOneBy(array $criteria, array $orderBy = null)
 * @method Film[]    findAll()
 * @method Film[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FilmRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Film::class);
    }

    public function listerFilmsAAfficher() :array {
        $dateJour = new \DateTime();
        return $this->createQueryBuilder('f')
            ->innerJoin(Seance::class,'s','WITH','s.film = f.id')
            ->where('s.dateProjection > :date')
            ->setParameter('date', $dateJour)
            ->getQuery()
            ->getResult();
    }

    public function detailsFilm(int $idFilm) :array {
        $dateJour = new \DateTime();
        return $this->createQueryBuilder('f')
            ->leftJoin('f.seances', 's')
            ->addSelect('s')
            ->where('f.id = :id')
            ->andWhere('s.dateProjection >= :date')
            ->setParameter('id', $idFilm)
            ->setParameter('date', $dateJour)
            ->orderBy('s.dateProjection', 'ASC')
            ->getQuery()
            ->getResult();
    }



//    /**
//     * @return Film[] Returns an array of Film objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('f')
//            ->andWhere('f.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('f.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Film
//    {
//        return $this->createQueryBuilder('f')
//            ->andWhere('f.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
