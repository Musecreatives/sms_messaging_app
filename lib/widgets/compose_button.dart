import 'dart:ui' as ui;
import '../core/app_export.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, ui.Size size) {
            
Path path_0 = Path();
    path_0.moveTo(0,5);
    path_0.cubicTo(0,2.23858,2.23858,0,5,0);
    path_0.lineTo(110,0);
    path_0.cubicTo(112.761,0,115,2.23858,115,5);
    path_0.lineTo(115,30.5);
    path_0.cubicTo(115,33.2614,112.761,35.5,110,35.5);
    path_0.lineTo(16.9187,35.5);
    path_0.cubicTo(15.6835,35.5,14.492,35.9572,13.5739,36.7835);
    path_0.lineTo(0,49);
    path_0.lineTo(0,5);
    path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = Color(0xff3047C0).withOpacity(1.0);
canvas.drawPath(path_0,paint0Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}