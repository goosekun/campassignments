import UIKit

class PokemonViewCell: UITableViewCell {

    var pokeImageView = UIImageView()
    var pokeTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pokeImageView)
        addSubview(pokeTitle)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a car and setting image to specific car passed in array
    func set(_ pokemon: Pokemon) {
        pokeImageView.image = pokemon.image
        pokeTitle.text = pokemon.name
    }
    
    func configureImageView() {
        pokeImageView.layer.cornerRadius = 2
        pokeImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        pokeTitle.numberOfLines = 0
        pokeTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        pokeImageView.translatesAutoresizingMaskIntoConstraints = false
        pokeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        pokeImageView.widthAnchor.constraint(equalTo: pokeImageView.heightAnchor, multiplier: 16/9).isActive = true
        pokeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setTitleLabelConstraints() {
        pokeTitle.translatesAutoresizingMaskIntoConstraints = false
        pokeTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokeTitle.leadingAnchor.constraint(equalTo: pokeImageView.trailingAnchor, constant: 20).isActive = true
        pokeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        pokeTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
