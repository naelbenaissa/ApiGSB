<?php

namespace App\Http\Controllers;

use App\Models\Frais;
use App\Models\Visiteur;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FraisController extends Controller
{
    function liste()
    {
        return response()->json(Frais::all());
    }

    function fraisVisiteur($id_visiteur)
    {
        return response()->json(Visiteur::find($id_visiteur)->Frais()->get());
    }

    function ajoutFrais(Request $request)
    {
        $id_etat = $request->id_etat;
        $anneemois = $request->anneemois;
        $id_visiteur = $request->id_visiteur;
        $nbjustificatifs = $request->nbjustificatifs;
        $datemodification = $request->datemodification;
        $montantvalide = $request->montantvalide;

        $frais = new Frais();

        $frais->id_etat = $id_etat;
        $frais->anneemois = $anneemois;
        $frais->id_visiteur = $id_visiteur;
        $frais->nbjustificatifs = $nbjustificatifs;
        $frais->datemodification = $datemodification;
        $frais->montantvalide = $montantvalide;

        $frais->save();

        return response()->json(['status' => "Frais ajouté", 'data' => $frais]);
    }

    function updateFrais(Request $request)
    {
        $idFrais = $request->id;

        $frais = Frais::find($idFrais);

        if (!$frais) {
            return response()->json(['status' => "Frais non trouvé", 'data' => null]);
        }

        $frais->id_etat = $request->id_etat;
        $frais->anneemois = $request->anneemois;
        $frais->id_visiteur = $request->id_visiteur;
        $frais->nbjustificatifs = $request->nbjustificatifs;
        $frais->datemodification = $request->datemodification;
        $frais->montantvalide = $request->montantvalide;

        $frais->save();

        return response()->json(['status' => "Frais modifié", 'data' => $frais]);
    }

    function deleteFrais($id)
    {
        Frais::destroy($id);
        return response()->json(['status' => "Frais supprimée"]);
    }

    function fraisMois($mois)
    {
        return response()->json(Frais::whereRaw("SUBSTRING(anneemois, 6, 2) = ?", [$mois])->select("id_frais", "id_etat", "montantvalide", "anneemois")->get());
    }

    function fraisMoisMontant($mois)
    {
        $sommeFrais = Frais::whereRaw("SUBSTRING(anneemois, 6, 2) = ?", [$mois])->sum('montantvalide');

        return response()->json(['Mois' => $mois, 'Somme des Frais' => $sommeFrais]);
    }

    function visiteurSansFrais()
    {
        return response()->json(Visiteur::whereDoesntHave('frais')->select('id_visiteur', 'nom_visiteur')->get());
    }

    function nombreFraisHF()
    {
        $nombreFraisHF  = DB::table('fraishorsforfait')->count();

        return response()->json(['Nombre de Frais Hors Forfait' => $nombreFraisHF ]);
    }
}
