(function () {

  var pyramid;

  function World () {
    this.scene = new THREE.Scene;
    this.scene.add(new Space);
    this.scene.add(new Ground);
    this.scene.add(new Pyramid);

    this.renderer = new THREE.WebGLRenderer({ alpha: true });

    this.aspect = this.aspect.bind(this);
    this.aspect();
    window.addEventListener('resize', this.aspect);

    this.place();

    this.render = this.render.bind(this);
    this.render();
  }

  World.prototype.place = function place () {
    document.body.appendChild(this.renderer.domElement);
  };

  World.prototype.render = function render () {
    requestAnimationFrame(this.render);
    this.renderer.render(this.scene, this.camera);
  };

  World.prototype.aspect = function () {
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.camera.position.z = 15;
    this.camera.position.y = 2;

    this.renderer.setSize(window.innerWidth, window.innerHeight);
  };

  function Space () {
    return new THREE.Mesh(this.geometry, this.material);
  }

  Space.prototype.geometry = new THREE.CubeGeometry(500, 500, 500, 1, 1, 1, null, true);
  Space.prototype.material = new THREE.MeshBasicMaterial({ color: 0x333356, side: THREE.BackSide });

  function Ground () {
    var mesh = new THREE.Mesh(this.geometry, this.material);
    mesh.rotation.x = -1.5
    return mesh;
  }

  Ground.prototype.geometry = new THREE.PlaneGeometry(500, 500, 3, 3);
  Ground.prototype.material = new THREE.MeshBasicMaterial({ color: 0x9bae9f });

  function Pyramid () {
    var mesh = new THREE.Mesh(this.geometry, this.material);
    mesh.position.y = 1.02;
    mesh.rotation.x = 0.0725
    return mesh;
  }

  Pyramid.prototype.geometry = new THREE.CylinderGeometry(0, 1.5, 2, 4, false);
  Pyramid.prototype.material = new THREE.MeshBasicMaterial({ wireframe: true, color: 0xffffff });

  new World;

})();
