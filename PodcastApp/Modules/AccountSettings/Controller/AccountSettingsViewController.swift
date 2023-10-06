//
//  AccountSettingsViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import SnapKit

struct ButtonsParams {
    var size: CGSize
    var radius: CGFloat
    var color: UIColor
    var image: String
    var title: String
}

struct TextParameters {
    var font: UIFont
    var text: String
}

struct ImageParameters {
    var size: CGSize
    var image: String
    var radiusImage: CGFloat
}

struct TextFieldParameters {
    var size: CGSize
    var radius: CGFloat
    var placeholder: String
}

final class AccountSettingsViewController: UIViewController {
    
    private var contentSize: CGSize {
        CGSize(
            width: view.frame.width,
            height: view.frame.height + 400
        )
    }
    private lazy var scrollView = AccountSettingsViewController.makeScrolView(
        contentSize: contentSize,
        view: self.view
    )
    private lazy var contentView = AccountSettingsViewController.makecontentView(
        contentSize: self.contentSize
    )
    private let imageProfileView = AccountSettingsViewController.makeView()
    private let imageParameters = ImageParameters(
        size: CGSize(
            width: 100,
            height: 100
        ),
        image: "face",
        radiusImage: 50
    )
    private lazy var imageProfile = AccountSettingsViewController.makeImage(
        parameters: imageParameters
    )
    private let editButtonParameters = ButtonsParams(
        size:
            CGSize(
                width: 32,
                height: 32
            ),
        radius:
            32/2,
        color: .blue,
        image: "",
        title: ""
    )
    private lazy var editButton = AccountSettingsViewController.makeButtonEdit(
        params: editButtonParameters
    )
    private let verticalStack = AccountSettingsViewController.makeStackVertical()
    private let textFirstParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 12)!,
        text: "First Name"
    )
    private lazy var firstNameLable = AccountSettingsViewController.makeLable(
        params: textFirstParam
    )
    private let textFieldParametersFirst = TextFieldParameters(
        size: CGSize(
            width: 327,
            height: 52
        ),
        radius: 52/2,
        placeholder: "Abigael"
    )
    private lazy var firstNameTextField = AccountSettingsViewController.makeTextField(
        parameters: textFieldParametersFirst
    )
    private let textSecondParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 12)!,
        text: "Last Name"
    )
    private lazy var lastNameLable = AccountSettingsViewController.makeLable(
        params: textSecondParam
    )
    private let textFieldParametersLast = TextFieldParameters(
        size: CGSize(
            width: 327,
            height: 52
        ),
        radius: 52/2,
        placeholder: "Amaniah"
    )
    private lazy var lastNameTextField = AccountSettingsViewController.makeTextField(
        parameters: textFieldParametersLast
    )
    private let textThirdParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 12)!,
        text: "E-mail"
    )
    private lazy var emailLable = AccountSettingsViewController.makeLable(
        params: textSecondParam
    )
    private let textFieldParametersEmail = TextFieldParameters(
        size: CGSize(
            width: 327,
            height: 52
        ),
        radius: 52/2,
        placeholder: "Amaniah@gmail.com"
    )
    private lazy var emailTextField = AccountSettingsViewController.makeTextField(
        parameters: textFieldParametersEmail
    )
    private let textFourthParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 12)!,
        text: "Date of Birth"
    )
    private lazy var dateLable = AccountSettingsViewController.makeLable(
        params: textFourthParam
    )
    private let textFieldParametersDate = TextFieldParameters(
        size: CGSize(
            width: 327,
            height: 52
        ),
        radius: 52/2,
        placeholder: "dd MMMM yy"
    )
    private lazy var dateTextField = AccountSettingsViewController.makeTextField(
        parameters: textFieldParametersDate
    )
    private let imageCalendar = ImageParameters(
        size: CGSize(
            width: 24,
            height: 24
        ),
        image: "calendar",
        radiusImage: 0
    )
    private lazy var imageViewCalendar = AccountSettingsViewController.makeImage(
        parameters: imageCalendar
    )
    private lazy var datePiker = UIDatePicker()
    private let textFivethParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 12)!,
        text: "Gender"
    )
    private lazy var genderLable = AccountSettingsViewController.makeLable(
        params: textFivethParam
    )
    private let saveButton = ButtonsParams(
        size:
            CGSize(
                width: 327,
                height: 56
            ),
        radius:
            15,
        color: .gray,
        image: "",
        title: ""
    )
    private lazy var saveChangeButton = AccountSettingsViewController.makeButton(
        params: saveButton
    )
    private lazy var horisontalStack = AccountSettingsViewController.makeStackHorisontal()
    private let maleButtonParams = ButtonsParams(
        size:
            CGSize(
                width: 156,
                height: 48
            ),
        radius:
            48/2,
        color: .gray,
        image: "checkmark.circle.fill",
        title: "Male"
    )
    private lazy var maleButton = AccountSettingsViewController.makeButtonImage(
        params: maleButtonParams
    )
    private let femaleButtonParams = ButtonsParams(
        size:
            CGSize(
                width: 156,
                height: 48
            ),
        radius:
            48/2,
        color: .gray,
        image: "checkmark.circle",
        title: "Female"
    )
    private lazy var femaleButton = AccountSettingsViewController.makeButtonImage(
        params: femaleButtonParams
    )
    private lazy var blur = AccountSettingsViewController.makeBlur()
    private lazy var alertView = AccountSettingsViewController.makeView()
    private let alertTextParam = TextParameters(
        font: UIFont(name: "Arial-BoldMT", size: 20)!,
        text: "Change your picture"
    )
    private lazy var alertLable = AccountSettingsViewController.makeLable(
        params: alertTextParam
    )
    private lazy var verticalStackAlert = AccountSettingsViewController.makeStackVertical()
    private let fotoButtonParams = ButtonsParams(
        size:
            CGSize(
                width: 296,
                height: 60
            ),
        radius:
            8,
        color: .gray,
        image: "",
        title: "Take a foto"
    )
    private lazy var fotoButton = AccountSettingsViewController.makeButtonImage(
        params: fotoButtonParams
    )
    private let chooseButtonParams = ButtonsParams(
        size:
            CGSize(
                width: 296,
                height: 60
            ),
        radius:
            8,
        color: .gray,
        image: "",
        title: "Choose from you file"
    )
    private lazy var chooseButton = AccountSettingsViewController.makeButtonImage(
        params: chooseButtonParams
    )
    private let deleteButtonParams = ButtonsParams(
        size:
            CGSize(
                width: 296,
                height: 60
            ),
        radius:
            8,
        color: .gray,
        image: "",
        title: "Delete photo"
    )
    private lazy var deleteButton = AccountSettingsViewController.makeButtonImage(
        params: deleteButtonParams
    )
    
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addViews(
            views:
                scrollView
        )
        scrollView.addSubview(contentView)
        imageProfileView.addViews(
            views:
                imageProfile,
            editButton
        )
        contentView.addSubview(
            imageProfileView
        )
        imageProfileView.backgroundColor = .cyan //временно
        contentView.addSubview(
            verticalStack
        )
        verticalStack.addViews(
            views:
                firstNameLable,
            firstNameTextField,
            lastNameLable,
            lastNameTextField,
            emailLable,
            emailTextField,
            dateLable,
            dateTextField,
            genderLable,
            horisontalStack
        )
        dateTextField.addSubview(
            imageViewCalendar
        )
        contentView.addSubview(
            saveChangeButton
        )
        
        horisontalStack.addViewInStack(
            stack: horisontalStack,
            views: maleButton,
            femaleButton
            )
        view.addSubview(alertView)
        alertView.addSubview(alertLable)
        alertView.addSubview(verticalStackAlert)
        verticalStackAlert.addViewInStack(stack: verticalStackAlert, views: fotoButton, chooseButton, deleteButton)
        
        
        //подписка на делегатный метод
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        //установка значений по умолчанию
        setAlertParams()
        setTargets()
    }
    
    
    //MARK: - Life Cycle func
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setPickerParams()
        setupConstraints()
    }
    
    //MARK: - func set constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            imageProfileView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageProfileView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 145),
            imageProfileView.heightAnchor.constraint(equalToConstant: 100),
            imageProfileView.widthAnchor.constraint(equalToConstant: 105),
            
            imageProfile.heightAnchor.constraint(equalToConstant: 100),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.leadingAnchor.constraint(equalTo: imageProfileView.leadingAnchor),
            imageProfile.topAnchor.constraint(equalTo: imageProfileView.topAnchor),
            imageProfile.bottomAnchor.constraint(equalTo: imageProfileView.bottomAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: imageProfileView.trailingAnchor),
            editButton.bottomAnchor.constraint(equalTo: imageProfileView.bottomAnchor),
            editButton.widthAnchor.constraint(equalToConstant: editButtonParameters.size.width),
            editButton.heightAnchor.constraint(equalToConstant: editButtonParameters.size.height),
            
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 261),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            verticalStack.heightAnchor.constraint(equalToConstant: 470),
            
            firstNameLable.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            firstNameLable.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLable.bottomAnchor),
            firstNameTextField.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            firstNameTextField.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            firstNameTextField.heightAnchor.constraint(equalToConstant: textFieldParametersFirst.size.height),
            
            lastNameLable.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10),
            lastNameLable.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLable.bottomAnchor),
            lastNameTextField.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            lastNameTextField.heightAnchor.constraint(equalToConstant: textFieldParametersLast.size.height),
            
            emailLable.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10),
            emailLable.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLable.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: textFieldParametersEmail.size.height),
            
        ])
        
        saveChangeButton.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(24)
            make.trailing.equalTo(contentView).offset(-24)
            make.bottom.equalTo(contentView).offset(-24)
            make.height.equalTo(56)
            make.width.equalTo(327)
        }
        
        dateLable.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStack).offset(0)
            //вопрос по отступу!!!
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(10)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStack).offset(0)
            //не понимаю пока инсет и офсет!!!
            make.top.equalTo(dateLable.snp_bottomMargin).inset(-10)
            make.height.equalTo(textFieldParametersDate.size.height)
            make.width.equalTo(textFieldParametersDate.size.width)
        }
        
        imageViewCalendar.snp.makeConstraints { make in
            make.trailing.equalTo(dateTextField.snp_trailingMargin).offset(-10)
            make.width.equalTo(imageCalendar.size.width)
            make.height.equalTo(imageCalendar.size.height)
            make.centerYWithinMargins.equalTo(dateTextField)
        }
        
        genderLable.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStack).offset(0)
            //вопрос по отступу!!!
            make.top.equalTo(dateTextField.snp_bottomMargin).offset(10)
        }
        
        horisontalStack.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStack).offset(0)
            make.top.equalTo(genderLable.snp_bottomMargin).offset(10)
        }
        
        maleButton.snp.makeConstraints { make in
            make.bottom.top.equalTo(horisontalStack).offset(0)
            make.width.equalTo(maleButtonParams.size.width)
            make.height.equalTo(maleButtonParams.size.height)
        }
        
        femaleButton.snp.makeConstraints { make in
            make.bottom.top.equalTo(horisontalStack).offset(0)
            make.width.equalTo(femaleButtonParams.size.width)
            make.height.equalTo(femaleButtonParams.size.height)
        }
        
        alertView.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(self.view)
            make.top.equalTo(self.view).offset(180)
            make.width.equalTo(328)
            make.height.equalTo(340)
        }
        
        alertLable.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(alertView)
            make.top.equalTo(alertView).offset(20)
        }
        
        verticalStackAlert.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalTo(alertView).offset(0)
            make.top.equalTo(alertLable.snp_bottomMargin).offset(10)
        }
        
        fotoButton.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(verticalStack)
            make.width.equalTo(fotoButtonParams.size.width)
            make.height.equalTo(fotoButtonParams.size.height)
        }
        chooseButton.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(verticalStack)
            make.width.equalTo(chooseButtonParams.size.width)
            make.height.equalTo(chooseButtonParams.size.height)
        }
        deleteButton.snp.makeConstraints { make in
            make.centerXWithinMargins.equalTo(verticalStack)
            make.width.equalTo(deleteButtonParams.size.width)
            make.height.equalTo(deleteButtonParams.size.height)
        }
        
    }
    
    
    //MARK: - @objct func
    @objc func maleButtonPressed() {
        print("Нажат")
    }
    
    @objc func femaleButtonPressed() {
        print("Не нажат")
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


//MARK: - private extension
private extension AccountSettingsViewController{
    static func makeScrolView(contentSize: CGSize, view: UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    static func  makecontentView(contentSize: CGSize) -> UIView {
        let contentView = UIView()
        contentView.frame.size = contentSize
        contentView.backgroundColor = .magenta
        contentView.translatesAutoresizingMaskIntoConstraints = true
        return contentView
    }
    
    static func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func makeButton(params: ButtonsParams) -> UIButton {
        let button = UIButton()
        button.frame.size = params.size
        button.layer.cornerRadius = params.radius
        button.backgroundColor = params.color
        button.setTitle("Save Changes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeButtonEdit(params: ButtonsParams) -> UIButton {
        var configuration = UIButton.Configuration.gray()
        // не масштабируется картнка кастомная
        configuration.image = UIImage(named: "pen")
        configuration.imagePlacement = .leading
        configuration.baseBackgroundColor = params.color
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 10)
        let button = UIButton(configuration: configuration)
        button.layer.cornerRadius = params.radius
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.borderColor =  UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeButtonImage(params: ButtonsParams) -> UIButton {
        var configuration = UIButton.Configuration.gray()
        configuration.image = UIImage(systemName: params.image)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 5
        configuration.title = params.title
        configuration.baseBackgroundColor = params.color
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 15)
        let button = UIButton(configuration: configuration)
        button.layer.cornerRadius = params.radius
        button.tintColor = .black
        button.clipsToBounds = true
        button.layer.borderColor =  UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func makeLable(params: TextParameters) -> UILabel {
        let lableView = UILabel()
        let textFont = params.font
        lableView.font = textFont
        lableView.text = params.text
        lableView.translatesAutoresizingMaskIntoConstraints = false
        return lableView
    }
    
    static func makeStackVertical() -> UIStackView {
        let stackVerticalView = UIStackView()
        stackVerticalView.axis = .vertical
        stackVerticalView.spacing = 3
        stackVerticalView.alignment = .center
        stackVerticalView.backgroundColor = .green
        stackVerticalView.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalView
    }
    
    static func makeStackHorisontal() -> UIStackView {
        let stackVerticalView = UIStackView()
        stackVerticalView.axis = .horizontal
        stackVerticalView.spacing = 3
        stackVerticalView.alignment = .center
        stackVerticalView.distribution = .equalCentering
        stackVerticalView.backgroundColor = .yellow
        stackVerticalView.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalView
    }
    
    static func makeImage(parameters: ImageParameters) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame.size = parameters.size
        imageView.image = UIImage(named: parameters.image)
        imageView.layer.cornerRadius = parameters.radiusImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func makeTextField(parameters: TextFieldParameters) -> UITextField {
        let textField = UITextField()
        textField.frame.size = parameters.size
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height)) //вынести конст
        textField.leftViewMode = .always
        textField.layer.cornerRadius = parameters.radius
        textField.placeholder = parameters.placeholder
        //установить стиль
        textField.layer.masksToBounds = true
        textField.layer.borderColor =  UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    static func makeTextFieldWithImage(parameters: TextFieldParameters) -> UITextField {
        let textField = UITextField()
        textField.frame.size = parameters.size
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height)) //вынести конст
        textField.leftViewMode = .always
        textField.layer.cornerRadius = parameters.radius
        textField.placeholder = parameters.placeholder
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    static func makeBlur() -> UIVisualEffectView {
        let blur = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
}

private extension UIView {
    func addViews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func addViewInStack(stack: UIStackView, views: UIView...) {
        for view in views {
            stack.addArrangedSubview(view)
        }
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




