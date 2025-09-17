//
//  ContentView.swift
//  Nu
//
//  Created by win603 on 10/09/25.
//
//Intrantes Marcelo Samuel Neri Ortiz 22751, Yahir Salazar Ortiz 22627, Fabiola Juarez Flores 22757

import SwiftUI

struct ContentView: View {
    @State private var showBalance = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Encabezado superior con íconos
                VStack{
                    HStack {
                        ZStack() {
                            Circle()
                                .opacity(0.2)
                                .frame(width: 50, height: 50)
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size:25))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        HStack(spacing: 20) {
                            Button(action: {
                                showBalance.toggle()
                            }) {
                                Image(systemName: showBalance ? "eye" : "eye.slash")
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.white)
                                Image(systemName: "person.and.person")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                    
                        
                        // Tarjeta promocional
                        HStack {
                            Image(systemName: "gift.fill")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(10)
                        Text("Haz crecer tu línea de crédito y tus ahorros")
                            .foregroundColor(.purple)
                            .font(.footnote)
                        Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(.purple)
                                .padding()

                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }.padding()
                    .background(Color.purple)
                
                // Sección: Cuenta Nu
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Cuenta Nu")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
                    Text(showBalance ? "$18.64" : "••••••••")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Acciones rápidas
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        QuickActionView(icon: "tray.and.arrow.down", label: "Recibir y depositar", badge: "Nuevo")
                        QuickActionView(icon: "arrow.right.arrow.left", label: "Transferir")
                        QuickActionView(icon: "dollarsign.circle", label: "Simular préstamo", badge: "$2,000")
                        QuickActionView(icon: "banknote", label: "Disponer de saldo", badge: "$7,981")
                        QuickActionView(icon: "lock.shield", label: "Pagar seguro")
                    }
                    .padding(.horizontal)
                }
                
                Divider().background(Color.gray)
                
                // Tarjeta de crédito
                VStack(alignment: .leading) {
                    HStack {
                        Text("Tarjeta de crédito")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    Text("Saldo actual")
                        .foregroundColor(.gray)
                    Text(showBalance ? "$18.64" : "••••••••")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("Fecha de corte: 16 SEP")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Text("Límite disponible: \(showBalance ? "$7,981.36" : "•••••••")")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "creditcard")
                            Text("Mis tarjetas")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Préstamo personal
                VStack(alignment: .leading) {
                    HStack {
                        Text("Préstamo personal")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    Text("Simula y descubre en segundos la oferta que tenemos para ti.")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                    Button(action: {}) {
                        Text("Simular préstamo")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Descubre más
                VStack(alignment: .leading, spacing: 10) {
                    Text("Descubre más")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            DiscoverCardView(title: "Prueba la Billetera de Google™", buttonText: "Saber más")
                            DiscoverCardView(title: "La era Nu se expande", buttonText: "¡Hazlo aquí!")
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }.background(Color.black)
    }
}



struct QuickActionView: View {
    var icon: String
    var label: String
    var badge: String? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                
                if let badge = badge {
                    Text(badge)
                        .font(.caption2)
                        .padding(4)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .offset(x: -10, y: 50) // Fuera del círculo, no afecta la altura total
                }
            }
            .frame(height: 72) // Fijamos altura para que todos estén alineados
            
            Text(label)
                .foregroundColor(.white)
                .font(.caption)
                .frame(width: 80)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true) // Que el texto no se corte ni desaparezca
                .frame(height: 40) // Altura fija para que todos los labels estén alineados
        }
    }
}


struct DiscoverCardView: View {
    var title: String
    var buttonText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 100)
                .cornerRadius(10)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.vertical, 4)
            
            Button(action: {}) {
                Text(buttonText)
                    .font(.caption)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
        }
        .frame(width: 160)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}

#Preview {
    ContentView()
}
