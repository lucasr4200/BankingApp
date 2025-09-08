//
//  LoginTests.swift
//  BankingApp
//
//  Created by Lucas Rasmusson on 2025-09-07.
//

import Testing
@testable import BankingApp

struct LoginTests {

    // MARK: - Helpers
        private func makeSUT() -> LoginViewController {
            let vc = LoginViewController()
            vc.loadViewIfNeeded() //triggers viewDidLoad -> style() /layout() (helper functions made)
            return vc
        }

        private func fill(_ sut: LoginViewController, user: String?, pass: String?) {
            sut.loginView.usernameTextField.text = user
            sut.loginView.passwordTextField.text = pass
        }

    
        // MARK: - Tests

        //tests if the initial state is that the error message is hidden
        @Test @MainActor
        func initialState_errorMessageHidden() async throws {
            let sut = makeSUT() //creates a LoginViewController and loads its view
            #expect(sut.errorMessageLabel.isHidden) //asserts that errorMessageLabel is hidden
            #expect(sut.errorMessageLabel.text == nil) // asserts no message is preloaded
        }

        //tests if the correct error message is shown and that it is correct when username and password are both empty and the sign in button is tapped
        @Test @MainActor
        func emptyUsernameOrPassword_showsRequiredError_andNoSpinner() async throws {
            let sut = makeSUT() // creates a LoginViewController and loads its view
            fill(sut, user: "", pass: "") //set both fields to empty strings

            sut.signInTapped(sender: sut.signInButton) //tap sign in button

            #expect(sut.errorMessageLabel.isHidden == false) //assert that the error message is shown
            #expect(sut.errorMessageLabel.text == "Username and password are required") //assert the error message text is correct
            #expect(sut.signInButton.configuration?.showsActivityIndicator != true) // assert activity indicator is not true
        }

        //tests if the error message is shown and that it is correct if the wrong username and passsword are given
        // and that the activity indicator is not shown
        @Test @MainActor
        func incorrectCredentials_showsIncorrectError_andNoSpinner() async throws {
            let sut = makeSUT()
            fill(sut, user: "wrong", pass: "creds")

            sut.signInTapped(sender: sut.signInButton)

            #expect(sut.errorMessageLabel.isHidden == false)
            #expect(sut.errorMessageLabel.text == "Incorrect username / password")
            #expect(sut.signInButton.configuration?.showsActivityIndicator != true)
        }

        //tests that the error message is hidden and that the activity indicator is succefully shown when sign in button is
        //tapped and the username and password are correct
        @Test @MainActor
        func validCredentials_showsSpinner_andHidesError() async throws {
            let sut = makeSUT()
            fill(sut, user: "User", pass: "password")

            sut.signInTapped(sender: sut.signInButton)

            #expect(sut.errorMessageLabel.isHidden)
            #expect(sut.signInButton.configuration?.showsActivityIndicator == true)
        }

}
