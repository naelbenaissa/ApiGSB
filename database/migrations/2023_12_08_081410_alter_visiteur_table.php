<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('visiteur', function (Blueprint $table) {
            $table->rememberToken();
            $table->timestamp();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('visiteur', function (Blueprint $table) {
            $table->dropColumn('remember_token');
            $table->dropColumn('created_at');
            $table->dropColumn('updates_at');
        });
    }
};
