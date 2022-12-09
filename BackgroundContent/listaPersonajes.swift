//
//  listaPersonajes.swift
//  BackgroundContent
//
//  Created by Ivan Gabriel on 09/12/22.
//

import UIKit

class listaPersonajes: UIViewController
{
    
    @IBOutlet var imageView: UIImageView!
    
    
    
    var urlImage : String?

    override func viewDidLoad()
            {
                super.viewDidLoad()
            }

    override func viewWillAppear( _ animated: Bool )
            {
                super.viewWillAppear( animated )
                let configuracion = URLSessionConfiguration.default
                let sesion = URLSession( configuration: configuracion )
                guard let laURL = URL( string: urlImage! )
                else { return }
                
                let request = URLRequest(url: laURL )
                let task = sesion.dataTask( with:request )
                        {
                            datos, response, error in
                            if  nil != error
                                    {
                                        print ( "Error \( String(describing: error?.localizedDescription ) )" )
                                        return
                                    }
                            guard let bytes = datos else
                                    {
                                        print ( "URL sin datos" )
                                        return
                                    }
                            
                            DispatchQueue.main.async
                                    {
                                        self.imageView.image = UIImage(data:bytes)
                                        self.view.addSubview( self.imageView )
                                    }
                        }
                task.resume()
            }
    @IBAction func btnReg(_ sender: Any)
            {
                    self.dismiss( animated: true, completion: nil )
            }

}
