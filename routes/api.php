<?php

use App\Http\Controllers\FraisController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\VisiteurController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// http://localhost:8000/api/
Route::prefix('frais')->group(function () {
    Route::get('', [FraisController::class, "liste"]);
    Route::get('visiteur/{id_visiteur}', [FraisController::class, "fraisVisiteur"]);
    Route::post('ajoutFrais', [FraisController::class, "ajoutFrais"]);
    Route::put('updateFrais/{id}', [FraisController::class, 'updateFrais']);
    Route::delete('deleteFrais/{id}', [FraisController::class, 'deleteFrais']);
    Route::get('mois/{mois}', [FraisController::class, 'fraisMois']);
    Route::get('moisMontant/{mois}', [FraisController::class, 'fraisMoisMontant']);
    Route::get('visiteurSansFrais', [FraisController::class, 'visiteurSansFrais']);
    Route::get('nombreFraisHF', [FraisController::class, 'nombreFraisHF']);
});

Route::prefix('visiteur')->group(function () {
   Route::get('', [VisiteurController::class, "liste"]);
   Route::get('ville/{ville_visiteur}', [VisiteurController::class, "visiteurVille"]);
   Route::get('nom/{nom_visiteur}', [VisiteurController::class, "visiteurNom"]);
   Route::post('ajoutVisiteur', [VisiteurController::class, "ajoutVisiteur"]);
   Route::delete('deleteVisiteur/{id}', [VisiteurController::class, 'deleteVisiteur']);
   Route::put('updateVisiteur/{id}', [VisiteurController::class, 'updateVisiteur']);
});

//auth
Route::post('getConnexion', [VisiteurController::class, "getConnexion"]);
