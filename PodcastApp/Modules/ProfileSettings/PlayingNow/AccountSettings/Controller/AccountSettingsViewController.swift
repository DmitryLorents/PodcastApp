//
//  AccountSettingsViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import SnapKit

final class AccountSettingsViewController: UIViewController {
    //MARK: - Variables
    
    private let textFieldHeight = 52
    private let edgeOffset: CGFloat = 24
    private var isMaleGender: Bool = true {
        didSet {
            maleButton.setImage(UIImage(systemName: isMaleGender ? "checkmark.circle.fill" : "circle" ), for: .normal)
            femaleButton.setImage(UIImage(systemName: !isMaleGender ? "checkmark.circle.fill" : "circle" ), for: .normal)
            }
        }
    private lazy var contentSize: CGSize = {
        CGSize(width: view.bounds.width, height: femaleButton.frame.maxY + 100)
    }()
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        return view
    }()
    
    private let profileView = UIView()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "face")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pen"), for: .normal)
        button.backgroundColor = .blueProfileColor
        button.tintColor = .systemBackground
        button.clipsToBounds = true
        button.layer.borderColor =  UIColor.systemBackground.cgColor
        button.layer.borderWidth = 3
        return button
    }()
    
    private var firstNameLable = CustomProfileLabel(title: "First Name")
    private var firstNameTextField = CustomTextFieldProfile(placeholder: "Abigael")
    private var lastNameLable = CustomProfileLabel(title: "Last Name")
    private var lastNameTextField = CustomTextFieldProfile(placeholder: "Amaniah")
    private lazy var emailLable = CustomProfileLabel(title: "E-mail")
    private lazy var emailTextField = CustomTextFieldProfile(placeholder: "Amaniah@gmail.com")
    private lazy var dateLable = CustomProfileLabel(title: "Date of Birth")
    private var dateTextField = CustomTextFieldProfile(placeholder: "dd MMMM yy")
    private lazy var imageViewCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var datePiker = UIDatePicker()
    private lazy var genderLable = CustomProfileLabel(title: "Gender")
    private lazy var maleButton = CustomProfileButton(title: "Male", isPressed: true)
    private lazy var femaleButton = CustomProfileButton(title: "Female", isPressed: false)
    private lazy var saveChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save changes", for: .normal)
        button.backgroundColor = .saveButtonColor
        button.layer.cornerRadius = 24
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    private let blur: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }()
    private lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    private lazy var verticalStackAlert: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .fill
        view.distribution = .fillEqually
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    private lazy var alertLable: UILabel = {
        let label = UILabel()
        label.font = .custome(name: .plusJakartaSans600, size: 20)
        label.tintColor = .black
        label.textAlignment = .center
        label.text = "Change your picture"
        return label
    }()
    private lazy var grayLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var fotoButton = CustomPhotoButton(title: "Take a photo", imageName: "")
    private lazy var chooseButton = CustomPhotoButton(title: "Choose from your file", imageName: "")
    private lazy var deleteButton = CustomPhotoButton(title: "Delete photo", imageName: "")
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        setViews()
        setupConstraints()
        setDelegates()
        setAlertParams()
        setTargets()
        setNavigationAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //hide back button text
        navigationController?.navigationBar.backItem?.title = ""
        navigationItem.backButtonTitle = ""
        //set content size
        scrollView.contentSize = contentSize
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    //MARK: - Rendering
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeRoundShape()
        setPickerParams()
        
    }
    
    //MARK: - Methods
    
    private func makeRoundShape() {
        profileImageView.makeRoundCorners()
        editButton.makeRoundCorners()
        firstNameTextField.makeRoundCorners()
        lastNameTextField.makeRoundCorners()
        emailTextField.makeRoundCorners()
        dateTextField.makeRoundCorners()
        maleButton.makeRoundCorners()
        femaleButton.makeRoundCorners()
        saveChangeButton.makeRoundCorners()
    }
    
    private func setViews() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        profileView.addViews(views: profileImageView, editButton)
        scrollView.addSubview(profileView)
        scrollView.addViews(views:
                                firstNameLable,
                            firstNameTextField,
                            lastNameLable,
                            lastNameTextField,
                            emailLable,
                            emailTextField,
                            dateLable,
                            dateTextField,
                            genderLable,
                            maleButton,
                            femaleButton,
                            saveChangeButton
        )
        dateTextField.addSubview(imageViewCalendar)
        view.addSubview(saveChangeButton)
        view.addSubview(alertView)
        alertView.addSubview(verticalStackAlert)
        verticalStackAlert.addArrangedSubview(alertLable)
        verticalStackAlert.addSubview(grayLineView)
        verticalStackAlert.addArrangedSubview(fotoButton)
        verticalStackAlert.addArrangedSubview(chooseButton)
        verticalStackAlert.addArrangedSubview(deleteButton)
        deleteButton.tintColor = .red
    }
    
    private func setNavigationAppearance() {
        //set custom arrow for back button
        let backViewImage = UIImage(named: "ArrowBackBig")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = backViewImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backViewImage
    }
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        profileView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(37)
            make.width.height.equalTo(100)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        editButton.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.bottom.trailing.equalToSuperview()
        }
        
        firstNameLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(edgeOffset)
            make.top.equalTo(profileView.snp.bottom).inset(-16)
        }
        
        
        
        firstNameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(edgeOffset)
            make.height.equalTo(textFieldHeight)
            make.top.equalTo(firstNameLable.snp.bottom).inset(-8)
        }
        
        lastNameLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(edgeOffset)
            make.top.equalTo(firstNameTextField.snp.bottom).inset(-16)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(textFieldHeight)
            make.top.equalTo(lastNameLable.snp.bottom).inset(-8)
        }
        
        emailLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(edgeOffset)
            make.top.equalTo(lastNameTextField.snp.bottom).inset(-16)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(textFieldHeight)
            make.top.equalTo(emailLable.snp.bottom).inset(-8)
        }
        
        dateLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(edgeOffset)
            make.top.equalTo(emailTextField.snp.bottom).inset(-16)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(textFieldHeight)
            make.top.equalTo(dateLable.snp.bottom).inset(-8)
        }
        
        imageViewCalendar.snp.makeConstraints { make in
            make.trailing.equalTo(dateTextField).offset(-14)
            make.width.height.equalTo(24)
            make.centerY.equalTo(dateTextField)
        }
        
        genderLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(edgeOffset)
            make.top.equalTo(dateTextField.snp.bottom).inset(-16)
        }
        
        maleButton.snp.makeConstraints { make in
            make.leading.equalTo(firstNameTextField)
            make.height.equalTo(48)
            make.top.equalTo(genderLable.snp.bottom).inset(-8)
        }
        
        femaleButton.snp.makeConstraints { make in
            make.trailing.equalTo(firstNameTextField)
            make.leading.equalTo(maleButton.snp.trailing).inset(-16)
            make.width.height.equalTo(maleButton)
            make.top.equalTo(maleButton)
        }
        
        saveChangeButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(56)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        alertView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalToSuperview().dividedBy(3.0)
        }
        
        verticalStackAlert.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(20)
        }
        
        grayLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(alertView)
            make.top.equalTo(alertLable.snp.bottom)
            make.height.equalTo(2)
        }
        
    }
    
    
    //MARK: - Button actions
    @objc func maleButtonPressed() {
        isMaleGender = true
    }
    
    @objc func femaleButtonPressed() {
        isMaleGender = false
    }
    
    @objc func editButtonPressed() {
        view.addSubview(blur)
        blur.frame = view.bounds
        view.addSubview(alertView)
        alertView.isHidden = !alertView.isHidden
    }
    
    
    @objc func saveButtonPressed() {
        let user = UserModel(firstName: firstNameTextField.text,
                             lastName: lastNameTextField.text,
                             eMail: emailTextField.text,
                             dateOfBithday: nil,
                             gender: Gender.Male,
                             image: nil)
        ProfileManager.shared.saveUser(user)
    }
    
    @objc func setDateCalendar(datePiker: UIDatePicker) {
        dateTextField.text = formatDate(date: datePiker.date)
        view.endEditing(true)
    }
    
    @objc func doneClicked(){
        dateTextField.text = formatDate(date: datePiker.date)
        view.endEditing(true)
    }
    
    
    //MARK: - private func
    
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
    
    private func setAlertParams(){
        alertView.backgroundColor = .white
        alertView.isHidden = true
    }
    
    private func setPickerParams(){
        datePiker.datePickerMode = .date
        datePiker.frame.size = CGSize(width: 0, height: 300)
        datePiker.preferredDatePickerStyle = .wheels
        datePiker.maximumDate = Date()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        dateTextField.inputView = datePiker
        dateTextField.inputAccessoryView = toolbar
    }
    
    private func setTargets(){
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        maleButton.addTarget(self, action: #selector(maleButtonPressed), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(femaleButtonPressed), for: .touchUpInside)
        saveChangeButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        datePiker.addTarget(self, action: #selector (setDateCalendar(datePiker:)), for: .valueChanged)
    }
}


//MARK: - extension
extension AccountSettingsViewController: UITextFieldDelegate, UIScrollViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard(textfield: textField)
        return true
    }
    
    func hideKeyboard(textfield: UITextField){
        textfield.resignFirstResponder()
    }
}




