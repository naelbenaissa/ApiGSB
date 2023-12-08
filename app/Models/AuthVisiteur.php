<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;


class AuthVisiteur extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'visiteur';
    protected $primaryKey = 'id_visiteur';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id_laboratoire',
        'id_secteur',
        'nom_visiteur',
        'prenom_visiteur',
        'adresse_visiteur',
        'cp_visiteur',
        'ville_visiteur',
        'date_embauche',
        'login_visiteur',
        'pwd_visiteur'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'pwd_visiteur',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'pwd_visiteur' => 'hashed',
        'id_laboratoire' => 'int',
        'id_secteur' => 'int',
        'date_embauche' => 'datetime'
    ];

    public function getAuthPassword()
    {
        return $this->pwd_visiteur;
    }

    public function laboratoire()
    {
        return $this->belongsTo(Laboratoire::class, 'id_laboratoire');
    }

    public function secteur()
    {
        return $this->belongsTo(Secteur::class, 'id_secteur');
    }

    public function frais()
    {
        return $this->hasMany(Frais::class, 'id_visiteur');
    }

    public function rapport_visites()
    {
        return $this->hasMany(RapportVisite::class, 'id_visiteur');
    }

    public function realisers()
    {
        return $this->hasMany(Realiser::class, 'id_visiteur');
    }

    public function travaillers()
    {
        return $this->hasMany(Travailler::class, 'id_visiteur');
    }
}
