class ImportedClans < Application

  def index
    render
  end

  def new
    render
  end

  def create
    DB.transaction do
      ImportedClan.import(params[:data]['tempfile'])
    end
    redirect url(:imported_clans)
  end

  def show
    @imported_clan = ImportedClan[params[:id]]
    @ingame_ids = @imported_clan.imported_players_dataset.order(:id).all.invoke(:ingame_id)
    render
  end
  
end
