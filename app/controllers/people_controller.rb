class PeopleController < ResourcesController
  private

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:person).permit(:name, :email, :age)
    end
end
