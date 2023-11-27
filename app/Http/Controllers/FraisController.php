<?php

namespace App\Http\Controllers;

use App\Models\Frais;
use App\Models\Visiteur;
use Illuminate\Http\Request;

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
}
