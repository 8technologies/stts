<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => 1,
            'name' => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. DictaLorem, ipsum dolor sit",
            'description' => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. DictaLorem, ipsum sit",
            'category_id' => 1,
            'price' => rand(1000,10000),
            'slug' => Str::slug("Romina"),
        ];
    }
 
}
