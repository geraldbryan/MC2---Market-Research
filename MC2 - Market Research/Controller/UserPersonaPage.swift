//
//  ResourcesViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class UserPersonaPage: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userPersonaTable: UITableView!
    @IBOutlet weak var resourcesCit: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Resource Page"
        resourcesCit.text = "Source: https://airfocus.com/glossary/what-is-a-user-persona/"
        
        userPersonaTable.register(ResourceHeadingTableViewCell.nib(), forCellReuseIdentifier: ResourceHeadingTableViewCell.identifier)
        userPersonaTable.register(ResourceOneParagraphTableViewCell.nib(), forCellReuseIdentifier: ResourceOneParagraphTableViewCell.identifier)
        
        userPersonaTable.delegate = self
        userPersonaTable.dataSource = self
        userPersonaTable.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "The benefits of user personas", text: "A well-researched, analytical and data-driven user persona is hugely beneficial to a company's product development, sales strategies and marketing campaigns. The function of user personas is to ensure that company initiatives (such as marketing or product development), are done with the user very firmly in mind.With respect to product development, this means avoiding the development of unnecessary features or products, by referring back to the users genuine needs. Instead of developing what designers or engineers want to build, efforts are concentrated only on what a user persona would find useful or practical to have. User personas are further used to understand if the target audience will use and engage with a product in the expected or desired way.")
            return cell
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Goal-directed personas:", text: "A goal-directed persona focuses on the methodology or approach that a user takes to solve a problem. By establishing the processes and workflows that a user would take, you aim to know how a user would use or engage with a product. This user persona is therefore associated with user experience (UX) and product development. ")
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Role-based personas:", text: "A role-based persona understands where a persona is within an organization, and how that affects their behavior and decision making. This user persona aims to broaden out the view from a goal-directed perspective to one that looks at how a job function and environment will impact the demands from a product or service. ")
            return cell
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Engaging personas:", text: "Engaging user personas are a holistic view of a persona that gives designers as much as possible to engage with. This persona is fleshed out with characteristics ranging from emotions and social background to their psychology. Emphasis is put on creating stories that enable the persona to come to life. This strategy improves design processes by helping teams genuinely envisage a person, and therefore deliver a better product.")
            return cell
        } else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Persona contents:", text: "You can make your persona with: Headline, Fictional Pictures, Brief Description, Habits, Goals, Pain, Motivations, etc.")
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceHeadingTableViewCell.identifier, for: indexPath) as! ResourceHeadingTableViewCell
        cell.resourceTitleLabel.text = "User Persona"
        cell.resourceImageLabel.text = "Photo by: unsplash"
        cell.headingParagraph.text = "User personas are profiles of imagined individuals that reflect a business’ core customer base. User personas are written as if the individual were real, but at the same time, they reflect common attributes across a cohort of people. They are semi-fictional, in that they are not a specific individual, but their characteristics should be gathered from observation of real-world users. User personas are intended to give a reliable and realistic reflection of how a business could expect a group of people to engage with a product, service or campaign."
        cell.resourceHeadingImage.image = UIImage(named: "user_persona.png")
        return cell
    }
    
}
