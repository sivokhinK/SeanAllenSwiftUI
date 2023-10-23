//
//  AccountView.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 10.09.2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedStateField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Group {
                        TextField("First Name", text: $viewModel.user.firstName)
                            .focused($focusedStateField, equals: .firstName)
                            .onSubmit { focusedStateField = .lastName }
                            .submitLabel(.next)
                        
                        TextField("Last Name", text: $viewModel.user.lastName)
                            .focused($focusedStateField, equals: .lastName)
                            .onSubmit { focusedStateField = .email }
                            .submitLabel(.next)

                        TextField("Email", text: $viewModel.user.email)
                            .focused($focusedStateField, equals: .email)
                            .onSubmit { focusedStateField = nil }
                            .submitLabel(.continue)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                } header: {
                    Text("Requests")
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedStateField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
