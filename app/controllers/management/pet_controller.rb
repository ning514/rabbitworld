class Management::PetController < ApplicationController
    def index
      @pet = Pet.all
    end
  end
  