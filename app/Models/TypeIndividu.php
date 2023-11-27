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
 * Class TypeIndividu
 *
 * @property int $id_type_individu
 * @property string|null $lib_type_individu
 *
 * @property Collection|Prescrire[] $prescrires
 *
 * @package App\Models
 */
class TypeIndividu extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'type_individu';
	protected $primaryKey = 'id_type_individu';
	public $timestamps = false;

	protected $fillable = [
		'lib_type_individu'
	];

	public function prescrires()
	{
		return $this->hasMany(Prescrire::class, 'id_type_individu');
	}
}
