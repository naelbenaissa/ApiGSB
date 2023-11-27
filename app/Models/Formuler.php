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
 * Class Formuler
 *
 * @property int $id_medicament
 * @property int $id_presentation
 * @property int|null $qte_formuler
 *
 * @property Medicament $medicament
 * @property Presentation $presentation
 *
 * @package App\Models
 */
class Formuler extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'formuler';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_medicament' => 'int',
		'id_presentation' => 'int',
		'qte_formuler' => 'int'
	];

	protected $fillable = [
		'qte_formuler'
	];

	public function medicament()
	{
		return $this->belongsTo(Medicament::class, 'id_medicament');
	}

	public function presentation()
	{
		return $this->belongsTo(Presentation::class, 'id_presentation');
	}
}
