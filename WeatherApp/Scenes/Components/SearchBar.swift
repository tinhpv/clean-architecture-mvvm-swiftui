//
//  SearchBar.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    let placeHolder: String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> some UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeHolder
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(text: $text)
    }
    
    final class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            text = searchBar.text ?? ""
            searchBar.endEditing(true)
        }
        
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.setShowsCancelButton(true, animated: true)
            return true
        }
        
        func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.setShowsCancelButton(false, animated: true)
            return true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.endEditing(true)
            searchBar.text = ""
            text = ""
        }
    }
}
