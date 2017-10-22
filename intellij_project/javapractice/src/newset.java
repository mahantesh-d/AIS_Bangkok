import java.util.HashSet;
import java.util.Objects;
import java.util.Scanner;
import java.util.Set;

/**
 * Created by Uno on 2/12/2017.
 */
public class newset {
    public static void main (String args[]){
        Set set = new HashSet();
        System.out.println("Enter the table name");
        Scanner scan = new Scanner(System.in);
        String message = scan.nextLine();
        if (Objects.equals(message, "stock_adjustment")) {
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"itemNo\": \"0002\"," +
                    "\"fromPlant\": \"1123\"," +
                    "\"fromStorage\": \"4351\"," +
                    "\"qty\": \"2\"," +
                    "\"serialList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"reason\": \"\"," +
                    "\"subStock\": \"Sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"reason\": \"text\"," +
                    "\"subStock\": \"Sale@Shop\"" +
                    "}]" +
                    "}");
        }
        if (Objects.equals(message, "obtain_detail")) {
            set.add("{" +
                    "\"salesCode\": \"3660\"," +
                    "\"salesType\": \"DirectSales\"," +
                    "\"salesName\": \"Suporn Roddon\"," +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"company\": \"AWN\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"itemNo\": \"0002\"," +
                    "\"qty\": \"10\"," +
                    "\"serialList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"reason\": \"\"," +
                    "\"fromSubStock\": \"Sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"reason\": \"text\"," +
                    "\"fromSubStock\": \"Sale@Shop\"" +
                    "}]" +
                    "}");
        }
        if (Objects.equals(message, "sub_stock_detail_transfer")){
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"outQty\": \"2\"," +
                    "\"unit\": \"set\"," +
                    "\"serialList\": [{" +
                    "\"fromSubStock\": \"Sale@Shop\"," +
                    "\"serial\": \"000000000000001\"," +
                    "\"reason\": \"\"" +
                    "}, {" +
                    "\"fromSubStock\": \"Sale@Shop\"," +
                    "\"serial\": \"000000000000002\"," +
                    "\"reason\": \"text\"" +
                    "}]" +
                    "}");
        }
        if (Objects.equals(message,"sub_stock_daily_detail")){
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"serialList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"reason\": \"\"," +
                    "\"statusBySerial\": \"Sold\"," +
                    "\"fromSubStock\": \"sale@shop\"," +
                    "\"qtyByStatus\": \"1\"," +
                    "\"qtyByPickup\": \"1\"," +
                    "\"createSerialBy\": \"somza\"," +
                    "\"createSerialDateTime\": \"2016-09-09 15:37:50+0700\"," +
                    "\"salesName\": \"somza\"," +
                    "\"receiptNo\": \"S01609090001\"," +
                    "\"msisdn\": \"66890009878\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"reason\": \"\"," +
                    "\"statusBySerial\": \"Sold\"," +
                    "\"fromSubStock\": \"sale@shop\"," +
                    "\"qtyByStatus\": \"1\"," +
                    "\"qtyByPickup\": \"1\"," +
                    "\"createBy\": \"somza\"" +
                    "}]" +
                    "}");
        }
        if (Objects.equals(message,"transfer_out_mismatch")){
            set.add("{" +
                    "\"matCode\": \"NEWAPP0SE16-GD01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"APPLE\"," +
                    "\"model\": \"IPHONESE16GB\"," +
                    "\"color\": \"GOLD\"," +
                    "\"commercialName\": \"NEW LTE APP IPHONESE 16GB-GOLD 01\"," +
                    "\"company\": \"AWN\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"overQty \": \"10\"," +
                    "\"missingQty\": \"10\"" +
                    "}");
        }
        if(Objects.equals(message, "request_goods")){
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"division\": \"11text\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"reqQty\": \"10\"," +
                    "\"unit\": \"SET\"," +
                    "\"quotaFlag\": \"Y\"," +
                    "\"quotaMstId\": \"\"," +
                    "\"quotaDtlId\": \"\"," +
                    "\"itemNo\": \"0001\"," +
                    "\"plantFrom\": \"1111\"," +
                    "\"storageFrom\": \"2222\"," +
                    "\"plantTo\": \"3333\"," +
                    "\"storageTo\": \"4444\"" +
                    "}");
        }
        if (Objects.equals(message,"order_transfer")){
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"transferQty\": \"10\"," +
                    "\"unit\": \"SET\"," +
                    "\"itemNo\": \"0001\"," +
                    "\"fromPlant\": \"1111\"," +
                    "\"fromStorage\": \"2222\"," +
                    "\"toPlant\": \"3333\"," +
                    "\"toStorage\": \"4444\"," +
                    "\"serialList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"toPlant\": \"\"," +
                    "\"toStorage\": \"\"," +
                    "\"reason\": \"\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"toPlant\": \"\"," +
                    "\"toStorage\": \"\"," +
                    "\"reason\": \"abcdefg\"" +
                    "}]" +
                    "}");
        }
        if (Objects.equals(message,"sale_out_detail")){
            set.add("{" +
                    "\"matCode\": \"NEWASUZC550-BK01\"," +
                    "\"matType\": \"serial\"," +
                    "\"commercialName\": \"ASUS 16G\"," +
                    "\"matDescription\": \"NEW 4G ASU MAX 16/2GB,5000mAh-BLACK 01\"," +
                    "\"brand\": \"ASUS\"," +
                    "\"model\": \"ZC550KL\"," +
                    "\"color\": \"BLACK\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"salesQty\": \"1\"," +
                    "\"stockBeforeQty\": \"5\"," +
                    "\"stockAfterQty\": \"4\"," +
                    "\"serialList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"serialStatus\": \"sale\"," +
                    "\"serialQty\": \"1\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"serialStatus\": \"sale\"," +
                    "\"serialQty\": \"1\"" +
                    "}]" +
                    "" +
                    "}");
        }
        if (Objects.equals(message,"check_out_stock_detail")){
            set.add("{" +
                    "\"company\": \"\"," +
                    "\"matCode\": \"\"," +
                    "\"matType\": \"\"," +
                    "\"brand\": \"\"," +
                    "\"model\": \"\"," +
                    "\"color\": \"\"," +
                    "\"commercialName\": \"ASUS16G\"," +
                    "\"matDescription\": \"NEW4GASUMAX16/2GB, 5000mAh-BLACK01\"," +
                    "\"productType\": \"DEVICE\"," +
                    "\"productSubType\": \"HANDSET\"," +
                    "\"totalScanQty\": \"\"," +
                    "\"diffQty\": \"0\"," +
                    "\"matchQty\": \"5\"," +
                    "\"serialMatchList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000003\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000004\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000005\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}]," +
                    "\"notFoundQty\": \"\"," +
                    "\"serialNotFoundList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000003\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000004\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000005\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}]," +
                    "\"notScanQty\": \"\"," +
                    "\"serialNotScanList\": [{" +
                    "\"serial\": \"000000000000001\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000002\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000003\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000004\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}, {" +
                    "\"serial\": \"000000000000005\"," +
                    "\"substock\": \"sale@Shop\"" +
                    "}]" +
                    "" +
                    "}");
        }

        System.out.println(set);
    }
}
