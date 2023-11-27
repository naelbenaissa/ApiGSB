<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class FraisFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'id_etat' => fake()->$this->id_etat,
            'anneemois' => fake()->$this->anneemois,
            'id_visiteur' => fake()->$this->id_visiteur,
            'nbjustificatifs' => fake()->$this->nbjustificatifs,
            'datemodification' => $this->faker->date(),
            'montantvalide' => fake()->$this->montantvalide,
        ];
    }
}
