<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
/**
 * Class Specialite
 *
 * @property int $id_specialite
 * @property string|null $lib_specialite
 *
 * @property Collection|Posseder[] $posseders
 *
 * @package App\Models
 */
class Specialite extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'specialite';
	protected $primaryKey = 'id_specialite';
	public $timestamps = false;

	protected $fillable = [
		'lib_specialite'
	];

	public function posseders()
	{
		return $this->hasMany(Posseder::class, 'id_specialite');
	}
}
