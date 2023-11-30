<?php

namespace App\Http\Controllers;

use App\Models\Frais;
use App\Models\User;
use App\Models\Visiteur;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class VisiteurController extends Controller
{
    function liste()
    {
        return response()->json(Visiteur::all());
    }

    function visiteurVille($ville_visiteur)
    {
        return response()->json(Visiteur::where('ville_visiteur', $ville_visiteur)->select('id_visiteur', 'nom_visiteur')->get());
    }

    function visiteurNom($nom_visiteur)
    {
        return response()->json(Visiteur::where('nom_visiteur', 'like', '%' . $nom_visiteur . '%')->select("*")->get());
    }

    function ajoutVisiteur(Request $request)
    {
        $id_laboratoire = $request->id_laboratoire;
        $id_secteur = $request->id_secteur;
        $nom_visiteur = $request->nom_visiteur;
        $prenom_visiteur = $request->prenom_visiteur;
        $adresse_visiteur = $request->adresse_visiteur;
        $cp_visiteur = $request->cp_visiteur;
        $ville_visiteur = $request->ville_visiteur;
        $date_embauche = $request->date_embauche;
        $login_visiteur = $request->login_visiteur;
        $pwd_visiteur = $request->pwd_visiteur;
        $type_visiteur = $request->type_visiteur;

        $visiteur = new Visiteur();

        $visiteur->id_laboratoire = $id_laboratoire;
        $visiteur->id_secteur = $id_secteur;
        $visiteur->nom_visiteur = $nom_visiteur;
        $visiteur->prenom_visiteur = $prenom_visiteur;
        $visiteur->adresse_visiteur = $adresse_visiteur;
        $visiteur->cp_visiteur = $cp_visiteur;
        $visiteur->ville_visiteur = $ville_visiteur;
        $visiteur->date_embauche = $date_embauche;
        $visiteur->login_visiteur = $login_visiteur;
        $visiteur->pwd_visiteur = $pwd_visiteur;
        $visiteur->type_visiteur = $type_visiteur;

        $visiteur->save();

        return response()->json(['status' => "Visiteur ajouté", 'data' => $visiteur]);
    }

    function updateVisiteur(Request $request)
    {
        $idVisiteur = $request->id;

        $visiteur = Visiteur::find($idVisiteur);

        if (!$visiteur) {
            return response()->json(['status' => "Visiteur non trouvé", 'data' => null]);
        }

        $visiteur->id_laboratoire = $request->id_laboratoire;
        $visiteur->id_secteur = $request->id_secteur;
        $visiteur->nom_visiteur = $request->nom_visiteur;
        $visiteur->prenom_visiteur = $request->prenom_visiteur;
        $visiteur->adresse_visiteur = $request->adresse_visiteur;
        $visiteur->cp_visiteur = $request->cp_visiteur;
        $visiteur->ville_visiteur = $request->ville_visiteur;
        $visiteur->date_embauche = $request->date_embauche;
        $visiteur->login_visiteur = $request->login_visiteur;
        $visiteur->pwd_visiteur = $request->pwd_visiteur;
        $visiteur->type_visiteur = $request->type_visiteur;

        $visiteur->save();

        return response()->json(['status' => "Visiteur modifié", 'data' => $visiteur]);
    }

    function deleteVisiteur($id)
    {
        Visiteur::destroy($id);
        return response()->json(['status' => "Visiteur supprimée"]);
    }

    public function getConnexion(Request $request) {
        if ($request->login_visiteur != null) {
            $login_visiteur = $request->login_visiteur;
            $pwd_visiteur = $request->pwd_visiteur;

            $visiteur = Visiteur::where('login_visiteur', $login_visiteur)
                ->where('pwd_visiteur', $pwd_visiteur)
                ->first();

            if ($visiteur) {
                return response()->json(['status' => "Visiteur identifié", 'data' => $visiteur]);
            } else {
                return response()->json(['status' => "Authentification incorrects", 'data' => null], 401);
            }
        } else {
            return response()->json(['status' => "Paramètres manquants", 'data' => null], 400);
        }
    }

    public function updatePassword()
    {
        try {
            $visiteurs = Visiteur::all();

            foreach ($visiteurs as $visiteur) {
                $visiteur->pwd_visiteur = Hash::make($visiteur->pwd_visiteur);
                $visiteur->save();
            }

            return response()->json(['status' => "Mots de passe mis à jour avec succès", 'data' => $visiteurs]);
        } catch (\Exception $e) {
            return response()->json(['status' => "Erreur lors de la mise à jour des mots de passe", 'data' => null], 500);
        }
    }

    public function login(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $request->validate([
                'email' => 'required|email',
                'password' => 'required',
            ]);
            $credentials = ['email' => $data['email'], 'password' => $data['password']];
        }
        if (!Auth::attempt($credentials)) {
            return response()->json(['error' => 'The provided credentials are incorrect.'], 401);
        }
        $user = User::where('email', $data['email'])->first();

        $token = $user->createToken('auth_token')->plainTextToken;
        $user->remember_token = $token;
        $user->save();
        $visiteur = Visiteur::find($user->id);;
        return response()->json([
            'visiteur' => [
                'id_visiteur' => $visiteur->id_visiteur,
                'nom_visiteur' => $visiteur->nom_visiteur,
                'prenom_visiteur' => $visiteur->prenom_visiteur,
                'type_visiteur' => $visiteur->type_visiteur,
            ],
            'access_token' => $token,
            'token_type' => 'bearer',
        ]);
        return response()->json(['error' => 'Request must be JSON.'], 415);
    }
}
