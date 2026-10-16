import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Full-screen camera capture. Pops with the captured image's file path (or
/// null if cancelled). Use [front] for selfies, back camera for documents.
class CameraCaptureView extends StatefulWidget {
  const CameraCaptureView({
    super.key,
    required this.front,
    this.title,
  });

  final bool front;
  final String? title;

  @override
  State<CameraCaptureView> createState() => _CameraCaptureViewState();
}

class _CameraCaptureViewState extends State<CameraCaptureView>
    with WidgetsBindingObserver {
  CameraController? _controller;
  bool _initialized = false;
  bool _capturing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _error = 'No camera available');
        return;
      }
      final lens = widget.front
          ? CameraLensDirection.front
          : CameraLensDirection.back;
      final camera = cameras.firstWhere(
        (c) => c.lensDirection == lens,
        orElse: () => cameras.first,
      );
      _controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _controller!.initialize();
      if (!mounted) return;
      setState(() => _initialized = true);
    } catch (e) {
      setState(() => _error = 'Camera failed to start');
    }
  }

  Future<void> _capture() async {
    if (!_initialized || _capturing) return;
    setState(() => _capturing = true);
    try {
      final image = await _controller!.takePicture();
      if (!mounted) return;
      Navigator.of(context).pop(image.path);
    } catch (_) {
      setState(() => _capturing = false);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _init();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleText = widget.title ?? (widget.front ? 'Take a selfie' : 'Capture document');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(titleText),
      ),
      body: _error != null
          ? Center(child: Text(_error!, style: const TextStyle(color: Colors.white)))
          : !_initialized
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: CameraPreview(_controller!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: IconButton(
                        iconSize: 72,
                        color: Colors.white,
                        onPressed: _capturing ? null : _capture,
                        icon: const Icon(Icons.circle, size: 64),
                      ),
                    ),
                  ],
                ),
    );
  }
}
