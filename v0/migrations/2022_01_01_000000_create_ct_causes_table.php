<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCtCausesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ct_causes', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('name', 100)->unique('causeName');
            $table->unsignedInteger('variable_id')->unique('ct_causes_variable_id_uindex');
            $table->timestamp('updated_at')->useCurrentOnUpdate()->useCurrent();
            $table->timestamp('created_at')->useCurrent();
            $table->softDeletes();
            $table->unsignedInteger('number_of_conditions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ct_causes');
    }
}
