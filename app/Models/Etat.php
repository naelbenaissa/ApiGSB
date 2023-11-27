<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

/**
 * Class Etat
 *
 * @property int $id_etat
 * @property string|null $lib_etat
 *
 * @property Collection|Frai[] $frais
 *
 * @package App\Models
 */
class Etat extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'etat';
	protected $primaryKey = 'id_etat';
	public $timestamps = false;

	protected $fillable = [
		'lib_etat'
	];

	public function frais()
	{
		return $this->hasMany(Frai::class, 'id_etat');
	}
}
