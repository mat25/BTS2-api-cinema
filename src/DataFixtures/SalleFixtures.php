<?php

namespace App\DataFixtures;

use App\Entity\Salle;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
;

class SalleFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = \Faker\Factory::create();
        $faker->addProvider(new \Xylis\FakerCinema\Provider\Person($faker));

        for ($i=0;$i<=20;$i++) {
            $salle = new Salle();
            $salle->setNomSalle($faker->actor);
            $salle->setNbPlace(random_int(15,150));
            $manager->persist($salle);

            $this->addReference("Salle"."$i",$salle);
        }
        $manager->flush();
    }
}
