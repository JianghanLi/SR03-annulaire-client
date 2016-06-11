package action;

import java.rmi.RemoteException;


public class Test {

	public static void main(String[] args) {
		ActionProxy actionProxy = new ActionProxy();
		String result = "";
		try {
			result = actionProxy.searchAll();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);

	}

}
