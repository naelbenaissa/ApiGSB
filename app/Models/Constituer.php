<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

/**
 * Class Constituer
 *
 * @property int $id_composant
 * @property int $id_medicament
 * @property float|null $qte_composant
 *
 * @property Composant $composant
 * @property Medicament $medicament
 *
 * @package App\Models
 */
class Constituer extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'constituer';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_composant' => 'int',
		'id_medicament' => 'int',
		'qte_composant' => 'float'
	];

	protected $fillable = [
		'qte_composant'
	];

	public function composant()
	{
		return $this->belongsTo(Composant::class, 'id_composant');
	}

	public function medicament()
	{
		return $this->belongsTo(Medicament::class, 'id_medicament');
	}
}
