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
 * Class Presentation
 *
 * @property int $id_presentation
 * @property string|null $lib_presentation
 *
 * @property Collection|Formuler[] $formulers
 *
 * @package App\Models
 */
class Presentation extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'presentation';
	protected $primaryKey = 'id_presentation';
	public $timestamps = false;

	protected $fillable = [
		'lib_presentation'
	];

	public function formulers()
	{
		return $this->hasMany(Formuler::class, 'id_presentation');
	}
}
