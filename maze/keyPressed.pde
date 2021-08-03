void keyPressed() {
    if (key == 'p') {
      System.out.println("resetting canvas and generate new maze");
      myCells.clear();
      setUpCells();
    }
    /*if (key == 's'){ //serialize the maze
      try
        {
            FileOutputStream fos = new FileOutputStream("mazeData");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(myCells);
            oos.close();
            fos.close();
            System.out.println("serialized myCells");
        } 
        catch (IOException ioe) 
        {
            ioe.printStackTrace();
        }
    }
    if(key == 'l'){ //deserialize the maze
     try{
       FileInputStream fis = new FileInputStream("mazeData");
       ObjectInputStream ois = new ObjectInputStream(fis);
       
       ArrayList<Cell> tempCells = (ArrayList)ois.readObject();
       if(tempCells.size() != totalCells) System.out.println("invalid cellSize for serialized input");
       else myCells = tempCells;
       ois.close();
       fis.close();
     }
     catch(FileNotFoundException e){
       e.printStackTrace();
       return;
     }
     catch(IOException e){
       e.printStackTrace();
       return;
     }
     catch (ClassNotFoundException c) 
        {
            System.out.println("Class not found");
            c.printStackTrace();
            return;
        }
    }*/
}
