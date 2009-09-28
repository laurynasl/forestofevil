class ImportedClan < Sequel::Model
  one_to_many :imported_players

  def self.import(stream)
    doc = LibXML::XML::HTMLParser.string(stream.read, :options => LibXML::XML::HTMLParser::Options::RECOVER).parse
    name_element = doc.find_first('/html/body/div[2]/div[6]/div[4]/h2')
    clan = create(
      :name => name_element.inner_xml
    )
    #tbody = doc.find_first('/html/body/div[2]/div[6]/div[4]/div[5]/table/tbody')
    tbody = doc.find_first('/html/body/div[2]/div[6]/div[4]/div/table/tbody')
    tbody.children.each do |tr|
      player_title = tr.children[0].children[0].to_s
      player_name = tr.children[0].children[1].inner_xml
      ingame_id = tr.children[0].children[1]['href'].split('=')[1]
      x_pos, y_pos = tr.children[0].children[3].inner_xml.split(':')
      ImportedPlayer.create(
        :imported_clan_id => clan.id,
        :name => player_name,
        :title => player_title,
        :ingame_id => ingame_id,
        :x_pos => x_pos,
        :y_pos => y_pos
      )
    end
    clan.update(:count => clan.imported_players_dataset.count)
  end
end
